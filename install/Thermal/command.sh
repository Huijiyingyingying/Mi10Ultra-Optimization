#!/system/bin/sh
FILE="$MODPATH/install/Thermal"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

function remove_thermal() {
 echo "exit 0" > $1
 chmod 7777 $1
 log "已生成文件 $1"
}

dirlist="/system/etc
/system/vendor/etc
/system/vendor/lib
/system/vendor/lib64
/system/bin
/system/vendor/bin
/system/vendor/lib64/hw
/system/vendor/lib/hw
/system/lib64"

for i in $dirlist; do
  mkdir -p $MODPATH$i
  chmod 7777 $i
done

if [ -e /system/etc/thermald.xml ] ; then
  remove_thermal $MODPATH/system/etc/thermald.xml
  remove_thermal $MODPATH/system/etc/thermald_performance.xml
  remove_thermal $MODPATH/system/etc/thermald_performance_qcoff.xml
  remove_thermal $MODPATH/system/etc/thermald_qcoff.xml
fi

if [ -e /system/bin/thermal-engine ] ; then
  remove_thermal $MODPATH/system/bin/thermal-engine
fi

if [ -e /system/vendor/bin/thermal-engine ] ; then
 remove_thermal $MODPATH/system/vendor/bin/thermal-engine
fi

if [ -e /system/bin/thermald ] ; then
  remove_thermal $MODPATH/system/bin/thermald
  remove_thermal $MODPATH/system/vendor/bin/thermald
fi

if [ -e /system/bin/thermalserviced ] ; then
  remove_thermal $MODPATH/system/bin/thermalserviced
  remove_thermal $MODPATH/system/vendor/bin/thermalserviced
fi

if [ -e /system/vendor/lib/libthermalioctl.so ] ; then
  remove_thermal $MODPATH/system/vendor/lib/libthermalioctl.so
  remove_thermal $MODPATH/system/vendor/lib/libthermalclient.so
  remove_thermal $MODPATH/system/vendor/lib64/libthermalioctl.so
  remove_thermal $MODPATH/system/vendor/lib64/libthermalclient.so
fi

if [ -e /system/vendor/etc/perf/perfboostconfig.xml ] ; then
  remove_thermal $MODPATH/system/vendor/etc/perf/perfboostconfig.xml
fi

for tso in $(ls /system/vendor/lib/hw/thermal.*.so /system/vendor/lib64/hw/thermal.*.so)
do
  remove_thermal ${MODPATH}${tso}
done

for tconf in $(ls /system/etc/thermal-engine*.conf /system/vendor/etc/thermal-engine*.conf)
do
  remove_thermal ${MODPATH}${tconf}
done

for tdconf in $(ls /system/etc/thermald-*.conf /system/vendor/etc/thermald-*.conf)
do
  remove_thermal ${MODPATH}${tdconf}
done

for mtk_conf in $(ls /system/etc/thermald-*.conf /system/vendor/etc/thermal-*.conf)
do
  remove_thermal ${MODPATH}${mtk_conf}
done

if [ -d /system/etc/.tp/ ] ; then
  mkremove_thermal $MODPATH/system/etc/.tp/.replace
fi

if [ -d /system/vendor/etc/.tp/ ] ; then
  mkremove_thermal $MODPATH/system/vendor/etc/.tp/.replace
fi

if [ -d /system/etc/.tp0/ ] ; then
  mkdir -p $MODPATH/system/etc/.tp0/
  chmod 7777 $MODPATH/system/etc/.tp0
  for mtt in $(ls /system/etc/.tp0/thermal.*.xml)
  do
    remove_thermal ${MODPATH}${mtt}
  done
fi

if [ -e /system/lib64/libthermalcallback.so ] ; then
  remove_thermal $MODPATH/system/lib64/libthermalcallback.so
  remove_thermal $MODPATH/system/lib64/libthermalservice.so
fi

if [ -e /system/bin/thermalserviced ] ; then
  mkdir -p ${MODPATH}/system/bin
  chmod 7777 ${MODPATH}/system/bin
  remove_thermal $MODPATH/system/bin/thermalserviced
fi

if [ -d /data/vendor/thermal/ ] ; then
  chmod -R 7777 /data/vendor/thermal/
  rm -rf /data/vendor/thermal/config
  remove_thermal /data/vendor/thermal/config
  chmod 0000 /data/vendor/thermal/config
fi
