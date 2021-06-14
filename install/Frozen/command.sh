#!/system/bin/sh
FILE="$MODPATH/install/Frozen"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

if [ ! -e $config/Frozen.txt ]; then
  cp -f $FILE/config/Frozen.txt $config/Frozen.txt
  log "检查到Frozen.txt文件不存在，已生成新文件"
fi

if [[ -e $MODPATH/folder/Inherit ]]; then
  source $config/Frozen.txt
  for Frozen_list in $Frozen; do
    pm disable $Frozen_list
    log "已冻结 $Frozen_list"
    sleep 0.05
  done
  echo 'Frozen="'$Frozen'"' >> $MODPATH/uninstall.sh
  echo 'for Frozen_list in $Frozen; do
    pm enable $Frozen_list
    log "已恢复 $Frozen_list"
    sleep 0.05
  done' >> $MODPATH/uninstall.sh
else
  echo "--- 是否应用当前的Frozen.txt配置冻结应用"
  echo "-- Frozen.txt文件在Android/Optimization文件夹中"
  echo "-- 第一次冻结建议先查看一下文件,看看有没有不需要冻结的"
  echo "- 按音量键＋: 确定"
  echo "- 按音量键－: 退出安装"
  if [[ $(get_choose) == 0 ]]; then
  	source $config/Frozen.txt
    for Frozen_list in $Frozen; do
      pm disable $Frozen_list
      log "已冻结 $Frozen_list"
      sleep 0.05
    done
    echo 'Frozen="'$Frozen'"' >> $MODPATH/uninstall.sh
    echo 'for Frozen_list in $Frozen; do
      pm enable $Frozen_list
      log "已恢复 $Frozen_list"
      sleep 0.05
    done' >> $MODPATH/uninstall.sh
  else
  	abort "- 修改完再重新安装吧~"
  fi
fi
