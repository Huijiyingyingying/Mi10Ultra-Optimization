#!/system/bin/sh
FILE="$MODPATH/install/Xiaobaitiao"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

mkdir -p $MODPATH/system/media/theme/default
cp -f $FILE/folder/* $MODPATH/system/media/theme/default/

log "[小白条]设置权限"
set_perm_recursive  $MODPATH/system/media/theme/default/com.miui.cloudservice  0  0  0644 u:object_r:system_file:s0
set_perm_recursive  $MODPATH/system/media/theme/default/framework-res  0  0  0644 u:object_r:system_file:s0
