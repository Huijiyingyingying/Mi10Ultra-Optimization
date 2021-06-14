#!/system/bin/sh
FILE="$MODPATH/install/LogDebug"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

if [[ -e /data/vendor/wlan_logs ]]; then
	Permission_setting /data/vendor/wlan_logs
	log "已删除不必要的网络日志并禁止写入"
	echo "uninstall_recover /data/vendor/wlan_logs" >> $MODPATH/uninstall.sh
	echo 'log "已恢复不必要的网络日志写入权限"' >> $MODPATH/uninstall.sh
fi

if [[ -e /system/vendor/bin/cnss_diag ]]; then
	mktouch $MODPATH/system/vendor/bin/cnss_diag
	log "存在cnss_diag 已创建模块文件"
	echo "uninstall_recover /data/media/0/JuphoonService" >> $MODPATH/uninstall.sh
	echo 'log "已恢复cnss_diag"' >> $MODPATH/uninstall.sh
fi

# 禁用小米程序调试
echo "sys.miui.ndcd=off" >> $MODPATH/system.prop

#关闭无用调试和日志
echo "persist.sys.perf.debug=false
debugtool.anrhistory=0
profiler.hung.dumpdobugreport=false
profiler.launch=false
persist.sys.whetstone.level=0" >> $MODPATH/system.prop

#蓝牙日志（根据开发者模式搞的）
echo "vendor.bluetooth.startbtlogger=false" >> $MODPATH/system.prop

#禁用错误检测
echo "ro.kernel.android.checkjni=0
ro.kernel.checkjni=0" >> $MODPATH/system.prop

#禁用wpa调试
echo "persist.wpa_supplicant.debug=false" >> $MODPATH/system.prop

#关闭主题日志
echo "rm -rf /data/user/0/MIUI/.cache
touch /data/user/0/MIUI/.cache
chmod 000 /data/user/0/MIUI/.cache" >> $MODPATH/post-fs-data.sh
