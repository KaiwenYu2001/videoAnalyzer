#include <iostream>
#include <evhttp.h>
#include <string.h>

namespace {
const std::string addr = "127.0.0.1";
const int port = 8001;
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
    // runAlgorthm();
}

// void runAlgorithm(){
    
// }

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