#!/system/bin/sh

#功能名字
Install_Name="优化系统进程优先级"
#安装时输出的信息
Install_Msg="将系统进程优化级调为-20，优先响应系统进程
再将系统进程优化分配至top-app,防止UI渲染时阻塞,提升使用流畅度"
#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_Condition="False"
#输出在description,不需输出为空即可
Install_description="优化系统进程优先级"

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
