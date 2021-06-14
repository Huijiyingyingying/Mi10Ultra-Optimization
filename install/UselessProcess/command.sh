#!/system/bin/sh
FILE="$MODPATH/install/UselessProcess"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

UselessProcess_list="system/bin/logd
system/etc/init/logd.rc
system/etc/init/bootlogoupdater
system/bin/mdnsd
system/etc/init/mdnsd.rc
system/etc/init/mobile_log_d
system/etc/init/dumpstate
system/bin/emdlogger1
system/etc/init/emdlogger1
system/bin/emdlogger3
system/etc/init/emdlogger3
system/bin/mdlogger
system/etc/init/mdlogger
system/vendor/etc/init/vendor.mediatek.hardware.log@1.0-service.rc
system/bin/connsyslogger
system/etc/init/connsyslogger"

for list in $UselessProcess_list; do
  mktouch $MODPATH/$list
  log "已生成文件 $list"
done

UselessProcess_list="logd
bootlogoupdater
mdnsd
mobile_log_d
dumpstate
emdlogger1
emdlogger3
mdlogger
aee.log-1-0
connsyslogger
"

echo 'UselessProcess_list="'$UselessProcess_list'"' >> $MODPATH/service.sh

echo 'for list in $UselessProcess_list; do
  am kill $list
  killall -9 $list
  am kill $list.rc
  killall -9 $list.rc
  log "强制关闭 $list 进程"
done' >> $MODPATH/service.sh
