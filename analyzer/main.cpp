#include <iostream>
#include <evhttp.h>
#include <string.h>
#include <event2/http.h>
#include <event2/keyvalq_struct.h>
#include <json/json.h>

namespace {
const std::string addr = "127.0.0.1";
const int port = 8001;
}

void test(evhttp_request *req, void *arg)
{
    std::string result_msg = "success";
    std::string streamUrl = "http:/127";
    int result_code = 1000;

    if (evhttp_request_get_command(req) != EVHTTP_REQ_POST) {
        return;
    }
    struct evbuffer* evbuf_get = evhttp_request_get_input_buffer(req);
    if (evbuf_get == nullptr) {
        return;
    }

    size_t len = evbuffer_get_length(evbuf_get);
    char* buffer = new char[len + 1];
    evbuffer_copyout(evbuf_get, buffer, len);
    buffer[len] = '\0';
    std::string postData(buffer);

    std::cout<< "copy print:" << buffer << std::endl;
    
    Json::Value data;
    Json::Value obj;
    obj["active"] = true;
    obj["flvUrl"] = "flvaddress";
    data.append(obj);

    Json::Value result;
    result["code"] = result_code;
    result["msg"] = result_msg;
    result["AlgorithmState"] = true;
    result["data"] = data;
    result["streamUrl"] = streamUrl;
    evhttp_add_header(req->output_headers, "Content-Type", "application/json");
    evhttp_add_header(req->output_headers, "Connection", "close");
    std::string jsonStr = result.toStyledString(); 
    evbuffer *evbuf = evbuffer_new();
    evbuffer_add(evbuf, jsonStr.c_str(), jsonStr.length());
    evhttp_send_reply(req, HTTP_OK, "OK", evbuf);
    evbuffer_free(evbuf);
    std::cout << "test uri: " << req->uri << std::endl;
    // runAlgorthm();
}


int main(int argc, char *argv[])
{
    event_base *base = event_base_new();
    struct evhttp *server = evhttp_new(base);
    evhttp_bind_socket(server, addr.c_str(), port);
    evhttp_set_cb(server, "/test", [](evhttp_request* req, void* arg){test(req, arg);}, nullptr);
    event_base_dispatch(base);
    evhttp_free(server);
    event_base_free(base);

    return 0;
}