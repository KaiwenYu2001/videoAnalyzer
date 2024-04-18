from django.shortcuts import render
from django.http import HttpResponse
from app.utils.Config import Config
from app.utils.ZLMediaKit import ZLMediaKit
import json
from app.utils.DjangoSql import DjangoSql
from app.utils.OSInfo import OSInfo

g_config = Config()
g_media = ZLMediaKit(config=g_config)
g_djangoSql = DjangoSql()


# Create your views here.
def index(request):
    return render(request, "app/index.html")


def web_streams(request):
    return render(request, "app/web_streams.html")


def web_player(request):
    return render(request, "app/web_player.html")

def web_index(request):
    return render(request, "app/web_index.html")

def myplayer(request):
    return render(request, "app/myplayer.html")


def api_getStreams(request):
    code = 0
    msg = "error"
    mediaServerState = False
    data = []
    try:
        streams = g_media.getMediaList()
        mediaServerState = g_media.mediaServerState
        # Get all user push streams
        for stream in streams:
            stream["ori"] = "推流"
            data.append(stream)

        code = 1000
        msg = "success"

    except Exception as e:
        log = "服务器内部异常，请检查流媒体服务："+ str(e)
        msg = log

    if mediaServerState:
        mediaServerState_msg = "<span style='color:green;font-size:14px;'>流媒体运行中</span>"
    else:
        mediaServerState_msg = "<span style='color:red;font-size:14px;'>流媒体未运行</span>"

    res = {
        "code":code,
        "msg":msg,
        "mediaServerState": mediaServerState,
        "mediaServerState_msg": mediaServerState_msg,
        "data":data
    }
    return HttpResponseJson(res)


def HttpResponseJson(res):

    def json_dumps_default(obj):
        if hasattr(obj, 'isoformat'):
            return obj.isoformat()
        else:
            raise TypeError

    return HttpResponse(json.dumps(res, default=json_dumps_default), content_type="application/json")


def api_getIndex(request):
    code = 0
    msg = "error"
    os_info = {}
    try:
        osSystem = OSInfo()
        os_info = osSystem.info()
        code = 1000
        msg = "success"
    except Exception as e:
        msg = str(e)

    res = {
        "code":code,
        "msg":msg,
        "os_info":os_info
    }
    
    return HttpResponseJson(res)



if __name__ == '__main__':
    streams = g_media.getMediaList()
    print(streams)