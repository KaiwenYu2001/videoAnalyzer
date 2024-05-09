# videoAnalyzer

## Week 4 summary  

本周对V2版本源码进行分析，在不同平台（macOS & Windows）上分别编译运行。\
同时访问ZLMediaKit源码，熟悉了流媒体服务器在不同平台上的应用及推流、拉流规则。

在mac平台上运行:

```bash
cd ZLMediaKit/release/linux/Debug
#通过-h可以了解启动参数
./MediaServer -h
#以守护进程模式启动
./MediaServer -d &
```

在windows平台上运行：

* 通过编译exe文件，然后通过bat脚本调用exe直接运行

### 项目模块及端口分配  _默认端口必须保留_

* 系统前端用户界面 `./Admin/manage.py runserver 0.0.0.0:9001` \
在`9001`端口上建立前端服务器。
* 流媒体运行服务器 `./MediaServer.exe` or `start.bat`\
`port=554`: resps服务器监听地址。
`port=1935`: rtmp服务器监听地址。
`sslport=443`: https服务器监听端口。
`port=80`: http服务器监听端口。

* 算法模块 `python ./Algorithm/AlgorithmApiServer.py`\
`port=9003`: 算法运行地址。

## Week 6 summary

**建立http-flv视频推流的方式：**

1. 运行ZLM服务，需要在运行ffmpeg推流命令前启动，否则会占用554端口。启动ZLM后会自动响应前端请求，生成相应格式的视频流。
2. 访问http-flv视频流的地址：`http://127.0.0.1:80/live/test.live.flv`


## Week 7 report

**Install cuda + cudnn + tensorrt and run test：**
When I run make file for the `sample_onnx_mnist` smaple, I get the following result. (ref: https://blog.csdn.net/lu_linux/article/details/134193901)


## Week 8 summary
完成yolov8的tensorrt部署，学习C++协程、调度器，用于启动后台算法。 

C++创建多线程：
```
# include<thread>

int main(){
    std::thread t(func);
    t.join();
    return 0;
}
```

多线程任务调度器