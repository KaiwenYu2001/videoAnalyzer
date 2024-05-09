# Libevent与http交互简单实例（CMake）

网上很多libevent例程没有提供相应的cmake库和动态链接，导致初学时遇到障碍。分享一个带cmake文件的例程，希望可以帮助到你。

## 代码及方法
1. 从libevent的[github仓库](https://github.com/libevent/libevent)下载libevent库并在本地编译。

2. 一个简单的相应前端的C++代码。来源：https://www.nephen.cn/posts/de95e5ac/ 

    ```
    #include <iostream>
    #include <evhttp.h>
    #include <string.h>

    namespace {
    const std::string addr = "127.0.0.1";
    const int port = 8080;
    }

    void common(evhttp_request *req, void *arg)
    {
        std::cout << "common uri: " << req->uri << std::endl;
        evhttp_send_reply(req, 200, "OK", NULL);
    }

    void test(evhttp_request *req, void *arg)
    {
        std::cout << "test uri: " << req->uri << std::endl;
        evhttp_send_reply(req, 200, "OK", NULL);
    }

    int main(int argc, char *argv[])
    {
        event_init(); //初始化event_base
        struct evhttp *server = evhttp_start(addr.c_str(), port);
        evhttp_set_cb(server, "/test", test, nullptr);
        evhttp_set_gencb(server, common, nullptr);
        event_dispatch(); //开始循环
        evhttp_free(server);

        return 0;
    }
    ```

3. CMakeLists内容：
    ```
    cmake_minimum_required(VERSION 3.9)
    project(coroutine_test)

    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_BUILD_TYPE "Debug")


    #设定头文件路径
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/libevent-master/include/)
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/libevent-master/build/include/)

    #设定链接库的路径（一般使用第三方非系统目录下的库）
    link_directories(${CMAKE_CURRENT_SOURCE_DIR}/libevent-master/build/lib)

    
    #生成可执行文件
    add_executable(main main.cpp)

    target_link_libraries(main event)

    ```

4. 执行cmake编译，并运行后端程序。验证方式为在前端输入”127.0.0.1/8080“,即可在terminal看到相应打印输出。

