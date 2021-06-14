#!/system/bin/sh
FILE="$MODPATH/install/FullPowerOff"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

cp -af $FILE/script/* $MODPATH/script/
cp -af $FILE/config/FullPowerOff.txt $MODPATH/script/config/FullPowerOff.txt

echo "chown root:root $FILE2/script/FullPowerOff.sh" >> $MODPATH/service.sh
echo "chmod 777 $FILE2/script/FullPowerOff.sh" >> $MODPATH/service.sh
echo "nohup $FILE2/script/FullPowerOff.sh &" >> $MODPATH/service.sh

if [[ -e $MODPATH/folder/Inherit ]]; then
  if [[ -e $config/FullPowerOff.txt ]]; then
    log "已跳过 替换新的FullPowerOff.txt"
  else
    cp -f $FILE/config/FullPowerOff.txt $config/FullPowerOff.txt
    log "检测到FullPowerOff.txt不存在,已生成新的文件"
  fi
else
  if [[ -e $config/FullPowerOff.txt ]]; then
    sleep 0.5
    echo " "
    echo "--- 检测到FullPowerOff.txt存在"
    echo "--- 是否替换新的FullPowerOff.txt(请选择)"
    echo "-- 替换则使用新的配置,不替换则保留原来的配置"
    echo "- 按音量键＋: 替换"
    echo "- 按音量键－: 不替换"
    if [[ $(get_choose) == 0 ]]; then
      echo "已选择 替换新的FullPowerOff.txt"
      cp -f $FILE/config/FullPowerOff.txt $config/FullPowerOff.txt
      log "已替换新的FullPowerOff.txt文件"
    else
      log "已跳过 替换新的FullPowerOff.txt"
    fi
  else
    cp -f $FILE/config/FullPowerOff.txt $config/FullPowerOff.txt
    log "检测到FullPowerOff.txt不存在,已生成新的文件"
  fi
fi
