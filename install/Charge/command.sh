#!/system/bin/sh
FILE="$MODPATH/install/Charge"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

mkdir -p $MODPATH/system/product/overlay
cp -f $FILE/folder/* $MODPATH/system/product/overlay/

log "设置权限"

set_perm_recursive "$MODPATH/system" 0 0 0755 0644
