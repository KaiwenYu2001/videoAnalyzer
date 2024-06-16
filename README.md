# videoAnalyzer

本项目的代码包含了基于Django的Web服务器的搭建，基于Yolov8和ByteTrack算法，在C++架构下实现并通过TensorRT与英伟达GPU加速的多目标跟踪算法，以及一套完整的基于FFmpeg模块开发的多媒体视频流拉流、推流以及编解码操作的后台处理框架。

## 声明

项目前端界面源码来自 <https://gitee.com/Vanishi/BXC_VideoAnalyzer_v2>

项目TensorRT加速框架部分来自 <https://github.com/wang-xinyu/tensorrtx>

ByteTrack部分代码源自 <https://github.com/emptysoal/TensorRT-YOLOv8-ByteTrack> 

## 开发环境

本项目在Ubuntu上开发测试，如是Windows用户需要自行安装配置第三方依赖。本项目硬件加速部分的运行需要第三方依赖的安装和配置，本项目所使用的环境依赖如下：

|  开发依赖 | 版本 | 开发依赖 | 版本 |
|  ----  | ----  | ----  | ----  |
| CUDA  | 11.8 |PyTorch  | 2.3.0 |
| CuDNN  | 8.0.5 | CMake  | 3.22.1 |
| TensorRT  | 8.6.1 | OpenCV  | 4.9.0 |

## 项目部署

### 前端服务部署

首先创建并激活虚拟环境

```bash
$ virtualenv venv
$ source ./venv/bin/activate
```

在虚拟环境中安装运行Django所需要的依赖

```bash
$ pip install -r admin/requirements.txt
```

在虚拟环境中启动Django服务，默认端口为8000。

```bash
$ python admin/manage.py runserver
```
命令运行成功后可以看到窗口打印输出服务器运行信息。在浏览器中访问 <http://127.0.0.1:8000/> 即可进入用户界面。

### 流媒体服务框架安装

首先需要为设备安装ffmpeg插件。Ubuntu中可以使用 `sudo apt install ffmpeg` 安装并通过 `ffmpeg -version` 来确认安装。如果下载过慢可将apt源更换为清华镜像。Windows用户请参照 <https://blog.csdn.net/bby1987/article/details/125562773>  

第二步为安装ZLMediakit作为流媒体转发框架。请参照<https://github.com/ZLMediaKit/ZLMediaKit> 编译安装。编译完成后，请在ZLMediakit的release目录中找到“config.ini”配置文件并复制密钥到本项目中的“config.json”。

运行测试时，我们必须在启动FFmpeg服务之前启动ZLMediakit。因为FFMpeg会占用443端口，导致ZLM框架启动失败。

启动ZLMediaserver：通过在用户自己的ZLMediakit的安装目录中启动ZLMediakit。可通过加入sudo命令来调用系统的第三方库。如在本项目中，在命令行窗口中执行：

```bash
$ sudo ./MediaServer
```

测试FFmpeg推流效果：在 `data` 目录中开启一个新的命令行窗口，执行：

```bash
$ sudo ffmpeg -re -stream_loop -1  -i test.mp4  -rtsp_transport tcp -c copy -f rtsp rtsp://127.0.0.1:9554/live/test
```

如果正常运行，那么可以看到ZLM服务窗口中打印的信息，并且可以在前端窗口的流媒体管理界面中看到视频流管理中打印出的流媒体信息。

### 后端算法部署

注：后端服务在搭建视频推流模块时遇到障碍，问题源于OpenCV和FFmpeg格式的不统一。所以现在后端代码分为两部分，Libevent测试框架和TensorRT-ByteTrack测试框架。开源代码中将两部分分开，需要开发者自行拓展功能。

首先部署Libevent框架用于交互。

```bash
# 切换到算法目录
$ cd analyzer

# 创建build文件夹并且进入
$ mkdir build
$ cd build

# 编译运行，加上sudo用于引用系统库
$ sudo cmake ..
$ sudo make
```

编译成功后，用 `sudo ./main` 命令可以运行后台进程。  

视频推理系统编译测试：位于 `TensorRT-YOLOv8-ByteTrack` 目录下，请参照 `TensorRT-YOLOv8-ByteTrack/README.md` 中的引导编译测试。  

