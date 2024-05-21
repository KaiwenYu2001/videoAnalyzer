# BXC_StreamPusher

* 作者：北小菜 
* 网站：https://www.beixiaocai.com
* 邮箱：bilibili_bxc@126.com
* QQ：1402990689
* 微信：bilibili_bxc
* 作者-哔哩哔哩主页：https://space.bilibili.com/487906612
* 作者-头条西瓜主页：https://www.ixigua.com/home/4171970536803763
* 软件下载地址：http://www.beixiaocai.com/code-detail/BXCStreamPusher

### 项目介绍

* 基于C++/FFmpeg4.4开发的零延迟摄像头拉流转码推流器
* 应用场景包括：摄像头视频流或其他视频流+实时转码+实时推流 零延迟



### 视频教程
*  [哔哩哔哩-从零开发国标GB28181流媒体服务器](https://www.bilibili.com/video/BV1Mv4y1d7Vy)
*  [哔哩哔哩-开发一个支持国标GB28181协议的摄像头模拟软件](https://www.bilibili.com/video/BV1cK411z73C)
*  [（本项目）哔哩哔哩-C++开发零延迟的摄像头拉流转码推流器](https://www.bilibili.com/video/BV1RN411K75R)
*  [哔哩哔哩-基于C++开发的支持国标GB28181协议的视频流播放器](https://www.bilibili.com/video/BV1sL411h7cN)


### 通过ffmpeg实现拉流+转码+推流（优化后，延时在900毫秒左右）

~~~

ffmpeg  -rtsp_transport udp -i srcUrl -fflags nobuffer -max_delay 1 -threads 5  -profile:v high  -preset superfast -tune zerolatency  -an -c:v h264 -crf 25 -s 1280*720   -f rtsp -bf 0  -g 5  -rtsp_transport udp dstUrl

ffmpeg  -rtsp_transport tcp -i rtsp://127.0.0.1:554/live/camera -fflags nobuffer -max_delay 1 -threads 5  -profile:v high  -preset superfast -tune zerolatency  -an -c:v h264 -crf 25 -s 1280*720   -f rtsp -bf 0  -g 5  -rtsp_transport tcp rtsp://127.0.0.1:554/live/camera2



ffmpeg  
-rtsp_transport tcp -i srcUrl 
-fflags nobuffer 
-max_delay 1 
-threads 5  
-profile:v high  
-preset superfast 
-tune zerolatency  
-an -c:v h264 
-crf 25 
-s 1280*720   
-f rtsp 
-bf 0  
-g 5  
-rtsp_transport udp dstUrl
			
~~~

### 通过推流本地文件，模拟一个摄像头的RTSP视频流

~~~
// rtsp推流（文件推流）
ffmpeg -re -i camera_60s.mp4 -rtsp_transport tcp -c copy -f rtsp rtsp://127.0.0.1:554/live/camera

// rtsp推流（文件循环推流）
ffmpeg -re -stream_loop  -1  -i camera_60s.mp4 -rtsp_transport tcp -c copy -f rtsp rtsp://127.0.0.1:554/live/camera

~~~

