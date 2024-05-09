from django.shortcuts import render
from django.http import HttpResponse
from app.utils.Config import Config
from app.utils.ZLMediaKit import ZLMediaKit
from app.utils.Analyzer import Analyzer
import json
from app.utils.DjangoSql import DjangoSql
from app.utils.OSInfo import OSInfo
import requests

g_config = Config()
g_media = ZLMediaKit(config=g_config)
g_djangoSql = DjangoSql()
g_analyzer = Analyzer(g_config.analyzerHost)


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

def web_control(request):
    return render(request, "app/web_control.html")


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


def api_runAlgorithm(request): # 对应BXC-api.py-api_getControls()
    res = requests.post(url='%s/test' % 'http://127.0.0.1:8001', headers=None,
                                data=None, timeout=10)  # test
    
    res = {
        "code":1,
        "msg":'msg'
    }
    return HttpResponseJson(res)

    code = 0
    msg = "error"
    mediaServerState = False
    ananyServerState = False

    atDBControls = [] #数据库中存储的布控数据

    try:
        __online_streams_dict = {}  #在线的视频流
        __online_controls_dict = {} #在线的布控数据

        __streams = g_media.getMediaList()
        mediaServerState = g_media.mediaServerState
        for d in __streams:
            if d.get("active"):
                __online_streams_dict[d.get("code")] = d

        if mediaServerState:
            __state, __msg, __controls = g_analyzer.controls()
            ananyServerState = g_analyzer.analyzerServerState
            for d in __controls:
                __online_controls_dict[d.get("code")] = d


        sql = "select ac.*,ab.name as algorithm_name from av_control ac left join av_algorithm as ab on ac.algorithm_code=ab.code order by ac.id desc"
        atDBControls = g_djangoSql.select(sql) #数据库中存储的布控数据
        atDBControlCodeSet = set() # 数据库中所有布控code的set

        for atDBControl in atDBControls:
            atDBControlCodeSet.add(atDBControl.get("code"))

            atDBControl_stream_code = "%s_%s"%(atDBControl["stream_app"],atDBControl["stream_name"])
            atDBControl["create_time"] = atDBControl["create_time"].strftime("%Y-%m-%d %H:%M")

            if __online_streams_dict.get(atDBControl_stream_code):
                atDBControl["stream_active"] = True # 当前视频流在线
            else:
                atDBControl["stream_active"] = False # 当前视频流不在线

            __online_control = __online_controls_dict.get(atDBControl["code"])
            atDBControl["checkFps"] = "0"

            if __online_control:
                atDBControl["cur_state"] = 1 # 布控中
                atDBControl["checkFps"] = "%.2f"%float(__online_control.get("checkFps"))
            else:
                if 0 == int(atDBControl.get("state")):
                    atDBControl["cur_state"] = 0 # 未布控
                else:
                    atDBControl["cur_state"] = 5 # 布控中断

            if atDBControl.get("state") != atDBControl.get("cur_state"):
                # 数据表中的布控状态和最新布控状态不一致，需要更新至最新状态
                update_state_sql = "update av_control set state=%d where id=%d " % (atDBControl.get("cur_state"), atDBControl.get("id"))
                g_djangoSql.execute(update_state_sql)

        for code,control in __online_controls_dict.items():
            if code not in atDBControlCodeSet:
                # 布控数据在运行中，但却不存在本地数据表中，该数据为失控数据，需要关闭其运行状态
                print("api_getControls() 当前布控数据还在运行在，但却不存在本地数据表中，已启动停止布控",code,control)
                g_analyzer.control_cancel(code=code)

        code = 1000
        msg = "success"
    except Exception as e:
        msg = str(e)

    if mediaServerState and ananyServerState:
        serverState = "<span style='color:green;font-size:14px;'>流媒体运行中，视频分析器运行中</span>"
    elif mediaServerState and not ananyServerState:
        serverState = "<span style='color:green;font-size:14px;'>流媒体运行中</span> <span style='color:red;font-size:14px;'>视频分析器未运行<span>"
    else:
        serverState = "<span style='color:red;font-size:14px;'>流媒体未运行，视频分析器未运行<span>"

    res = {
        "code":code,
        "msg":msg,
        "ananyServerState":ananyServerState,
        "mediaServerState":mediaServerState,
        "serverState":serverState,
        "data":atDBControls
    }
    return HttpResponseJson(res)


if __name__ == '__main__':
    streams = g_media.getMediaList()
    print(streams)