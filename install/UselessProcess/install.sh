#!/system/bin/sh

#功能名字
Install_Name="禁用无用的系统进程"
#安装时输出的信息
Install_Msg="禁用系统进程列表:
logd
bootlogoupdater
mdnsd
mobile_log_d
dumpstate
emdlogger1
emdlogger3
mdlogger
aee.log-1-0
connsyslogger"
#是否需要前提条件(条件命令写在子目录condition.sh)(True/False)
Install_Condition="False"
#输出在description,不需输出为空即可
Install_description="禁用无用的系统进程"

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
