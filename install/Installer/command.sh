#!/system/bin/sh
FILE="$MODPATH/install/Installer"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

mkdir -p $MODPATH/system/priv-app/MiuiPackageInstaller
cp -f $FILE/folder/* $MODPATH/system/priv-app/MiuiPackageInstaller/

log "[替换旧版本应用包管理组件]设置权限"

set_perm_recursive $MODPATH/system/priv-app/MiuiPackageInstaller/MiuiPackageInstaller.apk 0 0 0755 0644
