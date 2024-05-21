/*
 * 作者：北小菜
 * 个人网站：http://www.beixiaocai.com
 * 邮箱：bilibili_bxc@126.com
 * QQ：1402990689
 * 微信：bilibili_bxc
 * 作者-哔哩哔哩主页：https://space.bilibili.com/487906612
 * 作者-头条西瓜主页：https://www.ixigua.com/home/4171970536803763
 * github开源地址：https://github.com/any12345com/BXC_StreamPusher
 * gitee开源地址：https://gitee.com/Vanishi/BXC_StreamPusher
 * Created by 北小菜 on 2023/3/21
*/

#ifndef BXC_LOG_H
#define BXC_LOG_H

//  __FILE__ 获取源文件的相对路径和名字
//  __LINE__ 获取该行代码在文件中的行号
//  __func__ 或 __FUNCTION__ 获取函数名

#define LOGI(format, ...)  fprintf(stderr,"[INFO]%s [%s:%d %s()] " format "\n", "_",__FILE__,__LINE__,__func__ ,##__VA_ARGS__)
#define LOGE(format, ...)  fprintf(stderr,"[ERROR]%s [%s:%d %s()] " format "\n","_",__FILE__,__LINE__,__func__ ,##__VA_ARGS__)

#endif //BXC_LOG_H