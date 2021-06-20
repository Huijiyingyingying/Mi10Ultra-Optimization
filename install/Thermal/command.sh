#!/system/bin/sh
FILE="$MODPATH/install/Thermal"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

Thermal_list="system/vendor/bin/mi_thermald
system/vendor/bin/thermal-engine
system/vendor/etc/thermal-4k.conf
system/vendor/etc/thermal-8k.conf
system/vendor/etc/thermal-camera.conf
system/vendor/etc/thermal-chg-only.conf
system/vendor/etc/thermal-class0.conf
system/vendor/etc/thermal-engine.conf
system/vendor/etc/thermal-map.conf
system/vendor/etc/thermal-mgame.conf
system/vendor/etc/thermal-navigation.conf
system/vendor/etc/thermal-nolimits.conf
system/vendor/etc/thermal-normal.conf
system/vendor/etc/thermal-phone.conf
system/vendor/etc/thermal-tgame.conf
system/vendor/etc/thermal-video.conf
system/vendor/etc/thermald-devices.conf
system/vendor/etc/init/init.mi_thermald.rc
system/vendor/etc/init/init_thermal-engine.rc
system/vendor/etc/perf/thermalboost.conf"

for list in $Thermal_list; do
  mktouch $MODPATH/$list
  set_perm_recursive $MODPATH/$list 0 0 0755 0644
log "已删除文件 $list"
sleep 0.05
done
