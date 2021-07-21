#!/system/bin/sh
FILE="$MODPATH/install/MiStop"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

mkdir -p $MODPATH/system/framework
cp -f $FILE/folder/* $MODPATH/system/framework/

log "[破解卡米]设置权限"

set_perm_recursive $MODPATH/system/framework/services.jar 0 0 0755 0644
