#!/system/bin/sh
FILE="$MODPATH/install/RAMOptimization"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

mkdir -p $MODPATH/system/priv-app/MiuiHome
cp -f $FILE/folder/* $MODPATH/system/priv-app/MiuiHome/

log "[内测桌面]设置权限"
set_perm_recursive $MODPATH/system/priv-app/MiuiHome/MiuiHome.apk 0 0 0755 0644

log "[内测桌面]清理文件"
rm -rf /data/system/package_cache
