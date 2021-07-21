#!/system/bin/sh
FILE="$MODPATH/install/Replace/Sub"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

REPLACE_miuiplus="/system/priv-app/Mirror
/system/app/mi_connect_service"

for Replace_list in $REPLACE_miuiplus; do
  mktouch $MODPATH$Replace_list/.replace
  set_perm_recursive $MODPATH/$Replace_list 0 0 0755 0644
  log "已精简: $Replace_list"
  sleep 0.05
done
