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
#include <string>
#include "Log.h"
#include "StreamPusher.h"

int main(int argc, char *argv[]) {
	//ffmpeg RTSP推流 https://www.jianshu.com/p/a9c7b08be46e
	//ffmpeg 推流参数 https://blog.csdn.net/qq_17368865/article/details/79101659

	// StreamPusher.exe -i rtsp://127.0.0.1:554/live/test -o rtsp://127.0.0.1:554/live/c001

#ifdef WIN32
	srand(time(nullptr));//时间初始化
#endif // WIN32

	const char* srcUrl = nullptr;
	const char* dstUrl = nullptr;
	int dstVideoWidth = 1920;
	int dstVideoHeight = 1080;

	//const char* srcUrl = "rtsp://127.0.0.1:554/live/test";
	//const char* dstUrl = "rtsp://127.0.0.1:554/live/c001";

	for (int i = 1; i < argc; i += 2)
	{
		if (argv[i][0] != '-')
		{
			printf("parameter error:%s\n", argv[i]);
			return -1;
		}
		switch (argv[i][1])
		{
		case 'p': {
			//打印help信息
			printf("-p 打印参数配置信息并退出\n");
			printf("-i RTSP拉流地址   如：-i rtsp://127.0.0.1:554/live/test\n");
			printf("-o RTSP推流地址   如：-o rtsp://127.0.0.1:554/live/test2\n");
			printf("-w 推流分辨率宽    如：-w 1920，默认1920 \n");
			printf("-h 推流分辨率高    如：-h 1080，默认1080 \n");
			system("pause\n");
			exit(0);
			return -1;
		}
		case 'w': {
			dstVideoWidth = atoi(argv[i + 1]);
			break;
		}
		case 'h': {
			dstVideoHeight = atoi(argv[i + 1]);
			break;
		}
		case 'i': {
			srcUrl = argv[i + 1];
			break;
		}
		case 'o': {
			dstUrl = argv[i + 1];
			break;
		}
		default: {
			printf("set parameter error:%s\n", argv[i]);
			return -1;
		}
		}
	}

	if (srcUrl == nullptr) {
		LOGE("RTSP拉流地址不能为空");
		return -1;
	}
	if (dstUrl == nullptr) {
		LOGE("RTSP推流地址不能为空");
		return -1;
	}
	LOGI("srcUrl=%s,dstUrl=%s,dstVideoWidth=%d,dstVideoHeight=%d", 
		srcUrl, dstUrl, dstVideoWidth, dstVideoHeight);

    StreamPusher pusher(srcUrl, dstUrl, dstVideoWidth, dstVideoHeight);
    pusher.start();

    return 0;
}