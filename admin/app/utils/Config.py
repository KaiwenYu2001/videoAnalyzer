import json
import os
from admin.settings import BASE_DIR
class Config:
    def __init__(self):
        pass

        # filename = os.path.join("D:\\Project\\bxc\\BXC_VideoAnalyzer_v3\\Analyzer_v3", "config.json")

        BASE_DIR_last_dir = os.path.dirname(BASE_DIR)
        filename = os.path.join(BASE_DIR_last_dir, "config.json")

        f = open(filename, 'r', encoding='gbk')
        content = f.read()
        config_data = json.loads(content)
        f.close()

        print("Config.__init__",os.path.abspath(__file__))
        print("Config.__init__",config_data)

        host = config_data.get("host")
        rootDir =config_data.get("rootDir")
        adminPort =config_data.get("adminPort")
        analyzerPort =config_data.get("analyzerPort")
        mediaHttpPort =config_data.get("mediaHttpPort")
        mediaRtspPort =config_data.get("mediaRtspPort")
        mediaSecret =config_data.get("mediaSecret")

        self.host = host
        self.rootDir = rootDir
        self.adminHost = "http://"+host +":"+ str(adminPort)         # http://127.0.0.1:9001
        self.analyzerHost = "http://"+host +":"+ str(analyzerPort)   # http://127.0.0.1:9002
        self.mediaHttpHost = "http://"+host +":"+ str(mediaHttpPort) # http://127.0.0.1:80
        self.mediaRtspHost = "rtsp://"+host +":"+ str(mediaRtspPort) # http://127.0.0.1:554
        self.mediaSecret = mediaSecret

    def __del__(self):
        pass

    def show(self):
        pass


