/*
 * 作者：北小菜
 * 个人网站：http://www.beixiaocai.com
 * 邮箱：bilibili_bxc@126.com
 * QQ：1402990689
 * 微信：bilibili_bxc
 * 作者-哔哩哔哩主页：https://space.bilibili.com/487906612
 * 作者-头条西瓜主页：https://www.ixigua.com/home/4171970536803763
 * github开源地址：https://github.com/any12345com/BXC_StreamPusher
 * gitee开源地址：https://gitee.com/Vanishi/BXC_StreamPusher
 * Created by 北小菜 on 2023/3/21
*/
#include <iostream>
#include <thread>
#include <string>
#include "yolov8_lib.h"
#include "BYTETracker.h"
#include <opencv2/highgui.hpp>
#include <stdexcept>
#include "Log.h"
#include "StreamPusher.h"
extern "C"
{
#include <libswscale/swscale.h>
#include <libavcodec/avcodec.h>
#include <libavutil/imgutils.h>
#include <libavformat/avformat.h>
}
#pragma comment(lib, "swscale.lib")
#pragma comment(lib, "avcodec.lib")
#pragma comment(lib, "avutil.lib")
#pragma comment(lib, "avformat.lib")

using namespace std;
using namespace cv;

cv::Mat avframe2cvmat(AVFrame *avframe, int w, int h);
AVFrame *cvmat2avframe(cv::Mat mat);


StreamPusher::StreamPusher(const char* srcUrl, const char* dstUrl, int dstVideoWidth, int dstVideoHeight):
    mSrcUrl(srcUrl),mDstUrl(dstUrl),mDstVideoWidth(dstVideoWidth),mDstVideoHeight(dstVideoHeight){
    LOGI("StreamPusher::StreamPusher");
}
StreamPusher::~StreamPusher() {
    LOGI("StreamPusher::~StreamPusher");

}

void StreamPusher::start(){
    LOGI("StreamPusher::start begin");

    bool conn = this->connectSrc();
    if (conn) {
        conn = this->connectDst();
        if (conn) {
            // 初始化参数
            AVFrame* srcFrame = av_frame_alloc();// pkt->解码->frame
            AVFrame* dstFrame = av_frame_alloc();
            dstFrame->width = mDstVideoWidth;
            dstFrame->height = mDstVideoHeight;
            dstFrame->format = mDstVideoCodecCtx->pix_fmt;
            int dstFrame_buff_size = av_image_get_buffer_size(mDstVideoCodecCtx->pix_fmt, mDstVideoWidth, mDstVideoHeight, 1);
            uint8_t* dstFrame_buff = (uint8_t*)av_malloc(dstFrame_buff_size);
            av_image_fill_arrays(dstFrame->data, dstFrame->linesize, dstFrame_buff,
                mDstVideoCodecCtx->pix_fmt, mDstVideoWidth, mDstVideoHeight, 1);

            SwsContext* sws_ctx_src2dst = sws_getContext(mSrcVideoWidth, mSrcVideoHeight,
                mSrcVideoCodecCtx->pix_fmt,
                mDstVideoWidth, mDstVideoHeight,
                mDstVideoCodecCtx->pix_fmt,
                SWS_BICUBIC, nullptr, nullptr, nullptr);

            AVPacket srcPkt;//拉流时获取的未解码帧
            AVPacket* dstPkt = av_packet_alloc();// 推流时编码后的帧
            int continuity_read_error_count = 0;// 连续读错误数量
            int continuity_write_error_count = 0;// 连续写错误数量
            int ret = -1;
            int64_t frameCount = 0;
            while (true) {//不中断会继续执行
                if (av_read_frame(mSrcFmtCtx, &srcPkt) >= 0) {
                    continuity_read_error_count = 0;
                    if (srcPkt.stream_index == mSrcVideoIndex) {
                        // 读取pkt->解码->编码->推流
                        ret = avcodec_send_packet(mSrcVideoCodecCtx, &srcPkt);
                        if (ret == 0) {
                            ret = avcodec_receive_frame(mSrcVideoCodecCtx, srcFrame);
                            if (ret == 0) {
                                frameCount++;
                                //解码成功->修改分辨率->修改编码

                                // 原代码处理环节
                                // frame（yuv420p） 转 frame_bgr
                                // sws_scale(sws_ctx_src2dst,
                                //     srcFrame->data, srcFrame->linesize, 0, mSrcVideoHeight,
                                //     dstFrame->data, dstFrame->linesize);

                                // begin of 我的处理环节
                                cv::Mat img = avframe2cvmat(srcFrame, 0, 0);
                                dstFrame = cvmat2avframe(img);
                                cout << *dstFrame->data << endl;

                                // end of 我的处理环节

                                //开始编码 start
                                dstFrame->pts = dstFrame->pkt_dts = av_rescale_q_rnd(frameCount, mDstVideoCodecCtx->time_base, mDstVideoStream->time_base, (AVRounding)(AV_ROUND_NEAR_INF | AV_ROUND_PASS_MINMAX));
                                dstFrame->pkt_duration = av_rescale_q_rnd(1, mDstVideoCodecCtx->time_base, mDstVideoStream->time_base, (AVRounding)(AV_ROUND_NEAR_INF | AV_ROUND_PASS_MINMAX));
                                dstFrame->pkt_pos = frameCount;

                                ret = avcodec_send_frame(mDstVideoCodecCtx, dstFrame);
                                if (ret >= 0) {
                                    ret = avcodec_receive_packet(mDstVideoCodecCtx, dstPkt);
                                    if (ret >= 0) {
                                        // 推流 start
                                        dstPkt->stream_index = mDstVideoIndex;
                                        ret = av_interleaved_write_frame(mDstFmtCtx, dstPkt);
                                        if (ret < 0) {//推流失败
                                            LOGI("av_interleaved_write_frame error: ret=%d",ret);
                                            ++continuity_write_error_count;
                                            if (continuity_write_error_count > 5) {//连续5次推流失败，则断开连接
                                                LOGI("av_interleaved_write_frame error: continuity_write_error_count=%d,dstUrl=%s", continuity_write_error_count, mDstUrl.data());
                                                break;
                                            }
                                        }
                                        else {
                                            continuity_write_error_count = 0;
                                        }
                                        // 推流 end
                                    }
                                    else {
                                        LOGI("avcodec_receive_packet error: ret=%d", ret);
                                    }
                                }
                                else {
                                    LOGI("avcodec_send_frame error: ret=%d", ret);
                                }
                                //开始编码 end
                            }
                            else {
                                LOGI("avcodec_receive_frame error: ret=%d", ret);
                            }
                        }
                        else {
                            LOGI("avcodec_send_packet error: ret=%d", ret);
                        }

                        // std::this_thread::sleep_for(std::chrono::milliseconds(1));
                    }
                    //av_free_packet(&pkt);//过时
                    av_packet_unref(&srcPkt);
                
                }
                else {
                    //av_free_packet(&pkt);//过时
                    av_packet_unref(&srcPkt);
                    ++continuity_read_error_count;
                    if (continuity_read_error_count > 5) {//连续5次拉流失败，则断开连接
                        LOGI("av_read_frame error: continuity_read_error_count=%d,srcUrl=%s", continuity_read_error_count, mSrcUrl.data());
                        break;
                    }
                    else {
                        std::this_thread::sleep_for(std::chrono::milliseconds(100));
                    }
                }
            }

            // 销毁
            av_frame_free(&srcFrame);
            //av_frame_unref(srcFrame);
            srcFrame = NULL;

            av_frame_free(&dstFrame);
            //av_frame_unref(dstFrame);
            dstFrame = NULL;

            av_free(dstFrame_buff);
            dstFrame_buff = NULL;

            sws_freeContext(sws_ctx_src2dst);
            sws_ctx_src2dst = NULL;

        }
    }
    this->closeConnectDst();
    this->closeConnectSrc();

    LOGI("StreamPusher::start end");
}

bool StreamPusher::connectSrc() {

    mSrcFmtCtx = avformat_alloc_context();

    AVDictionary* fmt_options = NULL;
    av_dict_set(&fmt_options, "rtsp_transport", "tcp", 0); //设置rtsp底层网络协议 tcp or udp
    av_dict_set(&fmt_options, "stimeout", "3000000", 0);   //设置rtsp连接超时（单位 us）
    av_dict_set(&fmt_options, "rw_timeout", "3000000", 0); //设置rtmp/http-flv连接超时（单位 us）
    av_dict_set(&fmt_options, "fflags", "discardcorrupt", 0);
    //av_dict_set(&fmt_options, "timeout", "3000000", 0);//设置udp/http超时（单位 us）

    int ret = avformat_open_input(&mSrcFmtCtx, mSrcUrl.data(), NULL, &fmt_options);

    if (ret != 0) {
        LOGI("avformat_open_input error: srcUrl=%s", mSrcUrl.data());
        return false;
    }

    if (avformat_find_stream_info(mSrcFmtCtx, NULL) < 0) {
        LOGI("avformat_find_stream_info error: srcUrl=%s", mSrcUrl.data());
        return false;
    }

    // video start
    for (int i = 0; i < mSrcFmtCtx->nb_streams; i++)
    {
        if (mSrcFmtCtx->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO)
        {
            mSrcVideoIndex = i;
            break;
        }
    }
    //mSrcVideoIndex = av_find_best_stream(mFmtCtx, AVMEDIA_TYPE_VIDEO, -1, -1, nullptr, 0);

    if (mSrcVideoIndex > -1) {
        AVCodecParameters* videoCodecPar = mSrcFmtCtx->streams[mSrcVideoIndex]->codecpar;
        AVCodec* videoCodec = avcodec_find_decoder(videoCodecPar->codec_id);
        if (!videoCodec) {
            LOGI("avcodec_find_decoder error: srcUrl=%s", mSrcUrl.data());
            return false;
        }

        mSrcVideoCodecCtx = avcodec_alloc_context3(videoCodec);
        if (avcodec_parameters_to_context(mSrcVideoCodecCtx, videoCodecPar) != 0) {
            LOGI("avcodec_parameters_to_context error: srcUrl=%s", mSrcUrl.data());
            return false;
        }
        if (avcodec_open2(mSrcVideoCodecCtx, videoCodec, nullptr) < 0) {
            LOGI("avcodec_open2 error: srcUrl=%s", mSrcUrl.data());
            return false;
        }

        mSrcVideoCodecCtx->thread_count = 1;
        mSrcVideoStream = mSrcFmtCtx->streams[mSrcVideoIndex];

        if (0 == mSrcVideoStream->avg_frame_rate.den) {
            LOGI("avg_frame_rate.den = 0 error: srcUrl=%s", mSrcUrl.data());
            mSrcVideoFps = 25;
        }
        else {
            mSrcVideoFps = mSrcVideoStream->avg_frame_rate.num / mSrcVideoStream->avg_frame_rate.den;
        }

        mSrcVideoWidth = mSrcVideoCodecCtx->width;
        mSrcVideoHeight = mSrcVideoCodecCtx->height;
        mDstVideoFps = mSrcVideoFps;

    }
    else {
        LOGI("There is no video stream in the video: srcUrl=%s", mSrcUrl.data());
        return false;
    }
    // video end;
    return true;
}
void StreamPusher::closeConnectSrc(){
    std::this_thread::sleep_for(std::chrono::milliseconds(1));

    if (mSrcVideoCodecCtx) {
        avcodec_close(mSrcVideoCodecCtx);
        avcodec_free_context(&mSrcVideoCodecCtx);
        mSrcVideoCodecCtx = nullptr;
    }

    if (mSrcFmtCtx) {
        // 拉流不需要释放start
        //if (mFmtCtx && !(mFmtCtx->oformat->flags & AVFMT_NOFILE)) {
        //    avio_close(mFmtCtx->pb);
        //}
        // 拉流不需要释放end
        avformat_close_input(&mSrcFmtCtx);
        avformat_free_context(mSrcFmtCtx);
        mSrcFmtCtx = nullptr;
    }
}
bool StreamPusher::connectDst(){

    if (avformat_alloc_output_context2(&mDstFmtCtx, NULL, "rtsp", mDstUrl.data()) < 0) {
        LOGI("avformat_alloc_output_context2 error: dstUrl=%s", mDstUrl.data());
        return false;
    }

    // init video start
    AVCodec* videoCodec = avcodec_find_encoder(AV_CODEC_ID_H264);
    if (!videoCodec) {
        LOGI("avcodec_find_encoder error: dstUrl=%s", mDstUrl.data());
        return false;
    }
    mDstVideoCodecCtx = avcodec_alloc_context3(videoCodec);
    if (!mDstVideoCodecCtx) {
        LOGI("avcodec_alloc_context3 error: dstUrl=%s", mDstUrl.data());
        return false;
    }
    //int bit_rate = 300 * 1024 * 8;  //压缩后每秒视频的bit位大小 300kB
    int bit_rate = 4096000;
    // CBR：Constant BitRate - 固定比特率
    mDstVideoCodecCtx->flags |= AV_CODEC_FLAG_QSCALE;
    mDstVideoCodecCtx->bit_rate = bit_rate;
    mDstVideoCodecCtx->rc_min_rate = bit_rate;
    mDstVideoCodecCtx->rc_max_rate = bit_rate;
    mDstVideoCodecCtx->bit_rate_tolerance = bit_rate;

    //VBR
//        mDstVideoCodecCtx->flags |= AV_CODEC_FLAG_QSCALE;
//        mDstVideoCodecCtx->rc_min_rate = bit_rate / 2;
//        mDstVideoCodecCtx->rc_max_rate = bit_rate / 2 + bit_rate;
//        mDstVideoCodecCtx->bit_rate = bit_rate;

    //ABR：Average Bitrate - 平均码率
//        mDstVideoCodecCtx->bit_rate = bit_rate;

    mDstVideoCodecCtx->codec_id = videoCodec->id;
    mDstVideoCodecCtx->pix_fmt = AV_PIX_FMT_YUVJ420P;// 不支持AV_PIX_FMT_BGR24直接进行编码
    mDstVideoCodecCtx->codec_type = AVMEDIA_TYPE_VIDEO;
    mDstVideoCodecCtx->width = mDstVideoWidth;
    mDstVideoCodecCtx->height = mDstVideoHeight;
    mDstVideoCodecCtx->time_base = { 1,mDstVideoFps };
//        mDstVideoCodecCtx->framerate = { mDstVideoFps, 1 };
    mDstVideoCodecCtx->gop_size = 5;
    mDstVideoCodecCtx->max_b_frames = 0;
    mDstVideoCodecCtx->thread_count = 1;
    mDstVideoCodecCtx->flags |= AV_CODEC_FLAG_GLOBAL_HEADER;   //添加PPS、SPS
    AVDictionary* video_codec_options = NULL;

    //H.264
    if(mDstVideoCodecCtx->codec_id == AV_CODEC_ID_H264) {
//            av_dict_set(&video_codec_options, "profile", "main", 0);
        av_dict_set(&video_codec_options, "preset", "superfast", 0);
        av_dict_set(&video_codec_options, "tune", "zerolatency", 0);
    }
    //H.265
    if(mDstVideoCodecCtx->codec_id == AV_CODEC_ID_H265){
        av_dict_set(&video_codec_options, "preset", "ultrafast", 0);
        av_dict_set(&video_codec_options, "tune", "zero-latency", 0);
    }
    if (avcodec_open2(mDstVideoCodecCtx, videoCodec, &video_codec_options) < 0) {
        LOGI("avcodec_open2 error: dstUrl=%s", mDstUrl.data());
        return false;
    }
    mDstVideoStream = avformat_new_stream(mDstFmtCtx, videoCodec);
    if (!mDstVideoStream) {
        LOGI("avformat_new_stream error: dstUrl=%s", mDstUrl.data());
        return false;
    }
    mDstVideoStream->id = mDstFmtCtx->nb_streams - 1;
    // stream的time_base参数非常重要，它表示将现实中的一秒钟分为多少个时间基, 在下面调用avformat_write_header时自动完成
    avcodec_parameters_from_context(mDstVideoStream->codecpar, mDstVideoCodecCtx);
    mDstVideoIndex = mDstVideoStream->id;
    // init video end

    av_dump_format(mDstFmtCtx, 0, mDstUrl.data(), 1);

    // open output url
    if (!(mDstFmtCtx->oformat->flags & AVFMT_NOFILE)) {
        if (avio_open(&mDstFmtCtx->pb, mDstUrl.data(), AVIO_FLAG_WRITE) < 0) {
            LOGI("avio_open error: dstUrl=%s", mDstUrl.data());
            return false;
        }
    }


    AVDictionary* fmt_options = NULL;
    //av_dict_set(&fmt_options, "bufsize", "1024", 0);
    av_dict_set(&fmt_options, "rw_timeout", "30000000", 0); //设置rtmp/http-flv连接超时（单位 us）
    av_dict_set(&fmt_options, "stimeout", "30000000", 0);   //设置rtsp连接超时（单位 us）
    av_dict_set(&fmt_options, "rtsp_transport", "tcp", 0);
//        av_dict_set(&fmt_options, "fflags", "discardcorrupt", 0);

    //av_dict_set(&fmt_options, "muxdelay", "0.1", 0);
    //av_dict_set(&fmt_options, "tune", "zerolatency", 0);

    mDstFmtCtx->video_codec_id = mDstFmtCtx->oformat->video_codec;

    if (avformat_write_header(mDstFmtCtx, &fmt_options) < 0) { // 调用该函数会将所有stream的time_base，自动设置一个值，通常是1/90000或1/1000，这表示一秒钟表示的时间基长度
        LOGI("avformat_write_header error: dstUrl=%s", mDstUrl.data());
        return false;
    }
    return true;

}
void StreamPusher::closeConnectDst(){
    std::this_thread::sleep_for(std::chrono::milliseconds(1));

    if (mDstFmtCtx) {
        // 推流需要释放start
        if (mDstFmtCtx && !(mDstFmtCtx->oformat->flags & AVFMT_NOFILE)) {
            avio_close(mDstFmtCtx->pb);
        }
        // 推流需要释放end
        avformat_free_context(mDstFmtCtx);
        mDstFmtCtx = nullptr;
    }

    if (mDstVideoCodecCtx) {
        if (mDstVideoCodecCtx->extradata) {
            av_free(mDstVideoCodecCtx->extradata);
            mDstVideoCodecCtx->extradata = NULL;
        }

        avcodec_close(mDstVideoCodecCtx);
        avcodec_free_context(&mDstVideoCodecCtx);
        mDstVideoCodecCtx = nullptr;
    }

}


cv::Mat avframe2cvmat(AVFrame *avframe, int w, int h) {
 
	if (w <= 0) w = avframe->width;
	if (h <= 0) h = avframe->height;
	struct SwsContext *sws_ctx = NULL;
	sws_ctx = sws_getContext(avframe->width, avframe->height, (enum AVPixelFormat)avframe->format,
		w, h, AV_PIX_FMT_BGR24, SWS_BICUBIC, NULL, NULL, NULL);
 
	cv::Mat mat;
	mat.create(cv::Size(w, h), CV_8UC3);
	AVFrame *bgr24frame = av_frame_alloc();
	bgr24frame->data[0] = (uint8_t *)mat.data;
	avpicture_fill((AVPicture *)bgr24frame, bgr24frame->data[0], AV_PIX_FMT_BGR24, w, h);
	sws_scale(sws_ctx,
		(const uint8_t* const*)avframe->data, avframe->linesize,
		0, avframe->height, // from cols=0,all rows trans
		bgr24frame->data, bgr24frame->linesize);
 
	av_free(bgr24frame);
	sws_freeContext(sws_ctx);
	return mat;
}

AVFrame *cvmat2avframe(cv::Mat mat) {
 
	// alloc avframe
	AVFrame *avframe = av_frame_alloc();
	if (avframe && !mat.empty()) {
 
		avframe->format = AV_PIX_FMT_YUV420P;
		avframe->width = mat.cols;
		avframe->height = mat.rows;
		av_frame_get_buffer(avframe, 0);
		av_frame_make_writable(avframe);
		cv::Mat yuv; // convert to yuv420p first
		cv::cvtColor(mat, yuv, cv::COLOR_BGR2YUV_I420);
		// calc frame size
		int frame_size = mat.cols * mat.rows;
		unsigned char *pdata = yuv.data;
		// fill yuv420
		// yyy yyy yyy yyy
		// uuu
		// vvv
		avframe->data[0] = pdata; // fill y
		avframe->data[1] = pdata + frame_size; // fill u
		avframe->data[2] = pdata + frame_size * 5 / 4; // fill v
	}
	return avframe;
}
