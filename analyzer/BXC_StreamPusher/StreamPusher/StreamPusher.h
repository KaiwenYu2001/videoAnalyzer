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
#ifndef BXC_STREAMPUSHER_H
#define BXC_STREAMPUSHER_H
#pragma warning(disable: 4996)
#include <stdio.h>
#include <string>

extern "C" {
#include "libavcodec/avcodec.h"
#include "libavformat/avformat.h"
}

class StreamPusher {
public:
    explicit StreamPusher(const char* srcUrl, const char* dstUrl,int dstVideoWidth,int dstVideoHeight);
    StreamPusher() = delete;
    ~StreamPusher();
public:
    void start();
private:

    bool connectSrc();
    void closeConnectSrc();
    bool connectDst();
    void closeConnectDst();

private:
    std::string mSrcUrl;
    std::string mDstUrl;

    //源头
    AVFormatContext *mSrcFmtCtx = nullptr;
    AVCodecContext  *mSrcVideoCodecCtx = nullptr;
    AVStream        *mSrcVideoStream = nullptr;
    int              mSrcVideoIndex = -1;
    int       mSrcVideoFps = 25;// 拉流时更新
    int       mSrcVideoWidth = 1920;//拉流时更新
    int       mSrcVideoHeight = 1080;//拉流时更新
    int       mSrcVideoChannel = 3;//拉流时更新
    //目的
    AVFormatContext  *mDstFmtCtx = nullptr;
    AVCodecContext   *mDstVideoCodecCtx = nullptr;
    AVStream         *mDstVideoStream = nullptr;
    int               mDstVideoIndex = -1;
    int       mDstVideoFps = 25;//转码后默认fps
    int       mDstVideoWidth = 1920;//转码后默认分辨率宽
    int       mDstVideoHeight = 1080;//转码后默认分辨率高
    int       mDstVideoChannel = 3;


};



#endif //BXC_STREAMPUSHER_H
