#!/system/bin/sh

#功能名字
Install_Name="破解卡米"
#安装时输出的信息
Install_Msg="版本为:21.07.16 系统非此版本禁止安装
防止精简系统软件导致的卡米,例如系统更新等"
#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_Condition="False"
#输出在description,不需输出为空即可
Install_description="破解卡米"

#是否触发子功能(True/False)
Install_Subfunction="True"
#子功能名字
Install_SubName="精简系统更新"
#子功能代号
Install_SubCode="Sub_MiStop"
#子功能 安装时输出的信息
Install_SubMsg="看着系统更新占运存100MB表示不爽
精简应用列表:
#系统更新#/system/app/Updater
"
#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_SubCondition="False"
#输出在description,不需输出为空即可
Install_Subdescription=""
