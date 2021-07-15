#!/system/bin/sh

#功能名字
Install_Name="精简应用"
#安装时输出的信息
Install_Msg="可自定义编辑,代码在Android/Optimization/Replace.txt中
精简应用列表:
#Goodix指纹（出厂检测指纹用的，没任何影响，新路径）#/system/app/GFDelmarSetting
#联发科USIM卡应用（每次开机都提醒，没啥用处又占内存）#/system/priv-app/Stk1
#基本互动屏保（两个，无用功能，已被废除）
#/system/app/BasicDreams
#/system/product/app/PhotoTable
#MODEM测试工具（官方维修人员专用）#/system/app/ModemTestBox
#cit硬件功能检测（官方维修人员专用）#/system/app/Cit
#残疾人无障碍服务#/system/app/talkback
#天线服务#/system/app/AntHalService
#急救信息（无需用到且接口已被废除）#/system_ext/product/priv-app/EmergencyInfo
#小米免费短信服务（大概已知是移动对移动发送短信可免费，实用性=0且特别耗电）#/system/priv-app/MiRcs
#推送服务（两个，没任何影响）
#/system/app/WMService
#/system/app/WAPPushManager
#系统跟踪（无关痛痒的生成systrace报告，精简可提升流畅度）#/system/app/Traceur
#用户反馈#/system/app/MiuiBugReport
#服务与反馈#/system/priv-app/MiService
#用户信息收集#/system/app/MiuiDaemon
#用户手册#/system/app/Userguide
#用户字典#/system/priv-app/UserDictionaryProvider
#存储已屏蔽的号码（无任何影响）#/system/priv-app/BlockedNumberProvider
#高通USIM卡应用（每次开机都提醒，没啥用处又占内存）#/system/app/Stk
#SIM日志（无用）#/system/app/SimAppDialog
#SIM联系人（现在谁还用sim卡存储联系人号码..）#/system/app/SimContact
#反馈bug时收集日志#/system/app/CatchLog
#广告组件（两个）
#/system/app/AnalyticsCore
#/system/app/MSA
#内容中心#/system/priv-app/NewHome
#快应用支持组件（快应用组件精简后，息屏状态下按指纹会等一秒钟左右才会出现指纹解锁图案开始解锁）#/system/app/HybridAccessory
#快应用服务框架（占后台的应用。如果还存在可以在应用商店卸载，需要用到再重装）#/system/app/HybridPlatform
#Goodix指纹（出厂检测指纹用的，没任何影响）#/system/app/goodix_sz
#小米音乐#/system/app/Music
#MIUI12.5系统打印服务#/system/app/MiuiPrintSpoolerBete
#悬浮球#/system/app/MIUITouchAssistant
#搜索#/system/priv-app/QuickSearchBox
#生活黄页（与号码标识相关）#/system/priv-app/YellowPage
#投屏服务（三个）
#/system/app/MiPlayClient
#/system/app/MiLink
#/system/priv-app/WfdService
#小米智能卡（和NFC相关）#/system/app/TSMClient
#钱包#/system/app/Mipay
#小米支付#/system/app/NextPay
#米币支付#/system/app/PaymentService
#小米闻声#/system/app/MIUIAccessibility
#AI虚拟助手（MIUI12.5）#/system/product/app/aiasst_service
#传送门#/system/priv-app/ContentExtension
#常用语#/system/app/MIUIFrequentPhrase"

#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_Condition="False"
#输出在description,不需输出为空即可
Install_description="精简系统应用"

#是否触发子功能(True/False)
Install_Subfunction="True"
#子功能名字
Install_SubName="精简MIUI+"
#子功能代号
Install_SubCode="Sub_Replace"
#子功能 安装时输出的信息
Install_SubMsg="若用不到MIUI+的建议精简掉,挺占用运存的
精简应用列表:
MIUI+#/system/priv-app/Mirror
小米互联通信服务（推送服务，没任何影响，在12.5版本中与MIUI＋关联）#/system/app/mi_connect_service
"
#是否需要前提条件(条件命令写在子目录Condition.sh)(True/False)
Install_SubCondition="False"
#输出在description,不需输出为空即可
Install_Subdescription=""
