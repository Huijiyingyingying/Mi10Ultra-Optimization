#!/system/bin/sh
FILE="$MODPATH/install/Frozen_Google"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

Frozen_Google="com.google.android.gms
com.google.android.gsf
com.android.vending"

for Frozen_list in $Frozen_Google; do
  pm disable $Frozen_list
  log "已冻结 $Frozen_list"
  sleep 0.05
done
echo 'Frozen_Google="'$Frozen'"' >> $MODPATH/uninstall.sh
echo 'for Frozen_list in $Frozen_Google; do
  pm enable $Frozen_list
  log "已恢复 $Frozen_list"
  sleep 0.05
done' >> $MODPATH/uninstall.sh
