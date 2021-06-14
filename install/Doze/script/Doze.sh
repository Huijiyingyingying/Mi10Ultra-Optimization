#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"
source $FILE/script/log.sh

log "Doze深度息屏脚本已运行"

if [ ! -e $config/doze.txt ]; then
  cp -f $FILE/config/doze.txt $config/doze.txt
  log "检查到doze.txt文件不存在，已生成新文件"
fi

Doze() {
  #识别Doze状态
  screen=`dumpsys window policy | grep "mInputRestricted"|cut -d= -f2`
  #识别屏幕亮屏状态
  dumpsys deviceidle | grep -q Enabled=true
  check=$?
  if [[ $screen = true ]]; then
    if [[ $check = 1 ]]; then
      dumpsys deviceidle enable deep
      dumpsys deviceidle force-idle deep
      log "检测到屏幕为息屏状态,进入Doze深度息屏"
    fi
  else
    if [[ $check = 0 ]]; then
      dumpsys deviceidle disable all
      dumpsys deviceidle unforce
      log "检测到屏幕为亮屏状态,退出Doze深度息屏"
    fi
  fi
}

sleep 3

until false; do
  source $config/doze.txt
  sleep $doze_time
  Doze
done
