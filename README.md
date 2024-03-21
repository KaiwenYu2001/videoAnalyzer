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

