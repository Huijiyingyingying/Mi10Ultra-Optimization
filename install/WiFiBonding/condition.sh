#!/system/bin/sh
FILE="$MODPATH/install/WifiBonding"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

array=$(find /system /vendor -name WCNSS_qcom_cfg.ini)
for CFG in $array; do
	[[ -f $CFG ]] && [[ ! -L $CFG ]] && SELECTPATH=$CFG
done
[[ -z $SELECTPATH ]] && log "未找到WCNSS_qcom_cfg.ini文件,跳过安装WiFi Bonding" || $Install_Condition_log="False"
