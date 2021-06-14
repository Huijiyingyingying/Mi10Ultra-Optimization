#!/system/bin/sh
FILE="$MODPATH/install/Process"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

echo 'white_list() {
  if [ $1 = 0 ]; then
    pgrep -o $3 | while read pid; do
      renice -n -20 -p $pid
    done
  fi
  if [ $1 = 1 ]; then
    pgrep -f $3 | while read pid; do
      renice -n -20 -p $pid
    done
  fi
  if [ $2 = 1 ]; then
    echo $pid > /dev/cpuset/top-app/cgroup.procs
    echo $pid > /dev/stune/top-app/cgroup.procs
  fi
}' >> $MODPATH/service.sh

Process_1="surfaceflinger
webview_zygote"

Process_2="android.hardware.graphics.composer@2.2-service
zygote
zygote64
com.android.systemui"

Process_3="system_server
vendor.qti.hardware.display.composer-service
com.android.permissioncontroller
com.miui.home
com.miui.freeform
com.google.android.webview:webview_service"

echo 'Process_1="'$Process_1'"' >> $MODPATH/service.sh
echo 'Process_2="'$Process_2'"' >> $MODPATH/service.sh
echo 'Process_3="'$Process_3'"' >> $MODPATH/service.sh

echo 'for Process_list in $Process_1; do
  white_list 0 1 $Process_list
  log "已将进程 $Process_list 优先等级改为 -20"
  log "已将进程 $Process_list 分配至top-app中"
  sleep 0.05
done' >> $MODPATH/service.sh

echo 'for Process_list in $Process_2; do
  white_list 1 1 $Process_list
  log "已将进程 $Process_list 优先等级改为 -20"
  log "已将进程 $Process_list 分配至top-app中"
  sleep 0.05
done' >> $MODPATH/service.sh

echo 'for Process_list in $Process_3; do
  white_list 0 0 $Process_list
  log "已将进程 $Process_list 优先等级改为 -20"
  sleep 0.05
done' >> $MODPATH/service.sh

echo "echo 1 > /dev/stune/foreground/schedtune.prefer_idle
echo 1 > /dev/stune/background/schedtune.prefer_idle
echo 1 > /dev/stune/rt/schedtune.prefer_idle
echo 20 > /dev/stune/rt/schedtune.boost
echo 20 > /dev/stune/top-app/schedtune.boost
echo 1 > /dev/stune/schedtune.prefer_idle
echo 1 > /dev/stune/top-app/schedtune.prefer_idle
echo 50 > /dev/memcg/memory.swappiness" >> $MODPATH/service.sh
