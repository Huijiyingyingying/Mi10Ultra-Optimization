#!/system/bin/sh

#功能名字
Install_Name="冻结应用"
#安装时输出的信息
Install_Msg="可自行解冻,只在安装程序中冻结
可自定义编辑,代码在Android/Frozen.txt中
冻结应用列表:
#游戏高能时刻#com.miui.migameservice
#桌面云备份#com.miui.cloudbackup
#安全守护服务#com.miui.greenguard
#关机闹钟#com.qualcomm.qti.poweroffalarm
#MIUISDK#com.miui.core
#边角刘海屏#com.android.internal.display.cutout.emulation.corner
#双刘海屏#com.android.internal.display.cutout.emulation.double
#打孔屏#com.android.internal.display.cutout.emulation.hole
#长型刘海屏#com.android.internal.display.cutout.emulation.tall
#瀑布刘海屏#com.android.internal.display.cutout.emulation.waterfall"
#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_Condition="False"
#输出在description,不需输出为空即可
Install_description=""

#是否触发子功能(True/False)
Install_Subfunction="False"
#子功能名字
Install_SubName=""
#子功能代号
Install_SubCode=""
#子功能 安装时输出的信息
Install_SubMsg=""
#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_SubCondition=""
#输出在description,不需输出为空即可
Install_Subdescription=""
