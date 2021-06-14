#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

Frozen_Google="com.google.android.gms
com.google.android.gsf
com.android.vending"

for Frozen_list in $Frozen_Google; do
  pm disable $Frozen_list
  log "已冻结 $Frozen_list"
  sleep 0.05
done
