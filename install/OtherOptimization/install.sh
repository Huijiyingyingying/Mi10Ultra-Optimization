#!/system/bin/sh

#功能名字
Install_Name="更多小优化"
#安装时输出的信息
Install_Msg="小优化列表:
关闭强制使用软件GLES渲染
关闭ramdump
开启同用宽带压缩UBWC(可降低屏幕功耗，需设备支持)
开启大TCP数据包(可提升移动网络网速)
开启优化SurfaceFlinger缓冲区
VM虚拟堆大小(Dalvik优化)(提高RAM)
开启移动数据省电模式
开启小米GNSS增强选项
减轻低内存Kill后台机制
加快安装应用速度
加快dex2oat编译的速度
开启iorap功能(加快应用冷启动)
内存调控(减少杀后台的情况)
io调度优化
进程可打开文件数优化
预读优化"
#是否需要前提条件(条件命令写在子目录condition.sh)(True/False)
Install_Condition="False"
#输出在description,不需输出为空即可
Install_description="更多小优化"

#是否触发子功能(True/False)
Install_Subfunction="False"
#子功能名字
Install_SubName=""
#子功能代号
Install_SubCode=""
#子功能 安装时输出的信息
Install_SubMsg=""
#是否需要前提条件(条件命令写在子目录condition.sh)(True/False)
Install_SubCondition=""
#输出在description,不需输出为空即可
Install_Subdescription=""
