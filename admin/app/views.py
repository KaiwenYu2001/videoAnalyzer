from django.shortcuts import render
from django.http import HttpResponse
from app.utils.Config import Config
from app.utils.ZLMediaKit import ZLMediaKit
import json
from app.utils.DjangoSql import DjangoSql

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

        streams_in_camera_dict ={}
        cameras = g_djangoSql.select("select * from av_camera")
        cameras_dict = {}
        # 摄像头按照code生成字典
        for camera in cameras:
            push_stream_app = camera.get("push_stream_app")
            push_stream_name = camera.get("push_stream_name")
            code = "%s_%s" % (push_stream_app, push_stream_name)
            cameras_dict[code] = camera

        # 将所有在线的视频流分为用户推流的和摄像头推流的
        for stream in streams:
            stream_code = stream.get("code")
            if cameras_dict.get(stream_code):
                # 摄像头推流
                streams_in_camera_dict[stream_code] = stream
            else:
                # 用户推流
                stream["ori"] = "推流"
                data.append(stream)

        # 处理所有的摄像头，如果摄像头出现在在线视频流字典中，则更新到对应视频流的状态中
        for camera in cameras:
            push_stream_app = camera.get("push_stream_app")
            push_stream_name = camera.get("push_stream_name")
            code = "%s_%s" % (push_stream_app, push_stream_name)

            camera_stream = streams_in_camera_dict.get(code,None)

            stream = {
                "active": True if camera_stream else False,
                "code":code,
                "app": push_stream_app,
                "name": push_stream_name,
                "produce_speed": camera_stream.get("produce_speed") if camera_stream else "",
                "video": camera_stream.get("video") if camera_stream else "",
                "audio": camera_stream.get("audio") if camera_stream else "",
                "originUrl": camera_stream.get("originUrl") if camera_stream else "",  # 推流地址
                "originType": camera_stream.get("originType") if camera_stream else "",  # 推流地址采用的推流协议类型
                "originTypeStr": camera_stream.get("originTypeStr") if camera_stream else "",  # 推流地址采用的推流协议类型（字符串）
                "clients": camera_stream.get("clients") if camera_stream else 0,  # 客户端总数量
                "schemas_clients": camera_stream.get("schemas_clients") if camera_stream else [],
                "flvUrl": g_media.get_flvUrl(push_stream_app, push_stream_name),
                "hlsUrl": g_media.get_hlsUrl(push_stream_app, push_stream_name),
                "ori": camera.get("name")
            }
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