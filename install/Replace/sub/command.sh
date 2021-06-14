#!/system/bin/sh
FILE="$MODPATH/install/Replace/SUB"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

REPLACE_miuiplus="/system/priv-app/Mirror
/system/app/mi_connect_service"

for Replace_list in $REPLACE_miuiplus; do
  mktouch $MODPATH$Replace_list/.replace
log "已精简: $Replace_list"
sleep 0.05
done
