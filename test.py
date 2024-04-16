def getMediaList(self):
        __data = []
        try:

            url = "{host}/index/api/getMediaList?secret={secret}".format(
                host=self.__config.mediaHttpHost,
                secret=self.__config.mediaSecret
            )
            res = requests.get(url,headers={
                    "User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.57"
            },timeout=self.timeout)


            if 200 == res.status_code:
                res_json = res.json()

                if 0 == res_json["code"]:
                    data = res_json.get("data")
                    if data:
                        __data_group = {}  # 视频流按照流名称进行分组
                        for d in data:
                            app = d.get("app")  # 应用名
                            name = d.get("stream")  # 流id
                            schema = d.get("schema")  # 协议
                            code = "%s_%s" % (app, name)
                            v = __data_group.get(code)
                            if not v:
                                v = {}
                            v[schema] = d
                            __data_group[code] = v

                        for code, v in __data_group.items():
                            schemas_clients = []
                            index = 0
                            d = None
                            for __schema, __d in v.items():
                                schemas_clients.append({
                                    "schema": __schema,
                                    "readerCount": __d.get("readerCount")
                                })
                                if 0 == index:
                                    d = __d
                                index += 1

                            if d:
                                video_str = "无"
                                audio_str = "无"
                                tracks = d.get("tracks", None)
                                if tracks:
                                    for track in tracks:
                                        codec_id = track.get("codec_id")
                                        codec_id_name = track.get("codec_id_name")
                                        codec_type = track.get("codec_type", -1)  # Video = 0, Audio = 1
                                        ready = track.get("ready")

                                        if 0 == codec_type:
                                            fps = track.get("fps")
                                            height = track.get("height")
                                            width = track.get("width")

                                            video_str = "%s/%d/%dx%d" % (codec_id_name, fps, width, height)

                                        elif 1 == codec_type:
                                            channels = track.get("channels")

                                            sample_bit = track.get("sample_bit")
                                            sample_rate = track.get("sample_rate")

                                            audio_str = "%s/%d/%d/%d" % (
                                                codec_id_name, channels, sample_rate, sample_bit)

                                produce_speed = self.__byteFormat(d.get("bytesSpeed"))  # 数据产生速度，单位byte/s

                                app = d.get("app")  # 应用名
                                name = d.get("stream")  # 流id

                                __data.append({
                                    "active": True,
                                    "code": code,
                                    "app": app,
                                    "name": name,
                                    "produce_speed": produce_speed,
                                    "video": video_str,
                                    "audio": audio_str,
                                    "originUrl": d.get("originUrl"),  # 推流地址
                                    "originType": d.get("originType"),  # 推流地址采用的推流协议类型
                                    "originTypeStr": d.get("originTypeStr"),  # 推流地址采用的推流协议类型（字符串）
                                    "clients": d.get("totalReaderCount"),  # 客户端总数量
                                    "schemas_clients": schemas_clients,
                                    "flvUrl": self.get_flvUrl(app, name),
                                    "hlsUrl": self.get_hlsUrl(app, name)
                                })

            else:
                print("%s.%s() error:status=%d" % (self.__class__.__name__,
                                          inspect.getframeinfo(inspect.currentframe().f_back)[2],
                                          res.status_code))
            self.mediaServerState = True
        except Exception as e:
            self.mediaServerState = False
            print("getMediaList() error: %s"%(str(e)))

        return __data