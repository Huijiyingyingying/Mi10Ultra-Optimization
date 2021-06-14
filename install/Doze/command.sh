#!/system/bin/sh
FILE="$MODPATH/install/Doze"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

cp -af $FILE/script/Whitelist.sh $MODPATH/script/Whitelist.sh
cp -af $FILE/script/Doze.sh $MODPATH/script/Doze.sh

echo "chown root:root $FILE2/script/Doze.sh" >> $MODPATH/service.sh
echo "chmod 777 $FILE2/script/Doze.sh" >> $MODPATH/service.sh
echo "nohup $FILE2/script/Doze.sh &" >> $MODPATH/service.sh
echo "chown root:root $FILE2/script/Whitelist.sh" >> $MODPATH/service.sh
echo "chmod 777 $FILE2/script/Whitelist.sh" >> $MODPATH/service.sh
echo "nohup $FILE2/script/Whitelist.sh &" >> $MODPATH/service.sh

if [[ -e $MODPATH/folder/Inherit ]]; then
  if [[ -e $config/whitelist.txt ]]; then
    echo "已跳过 替换新的whitelist.txt"
  else
    cp -f $FILE/config/whitelist.txt $config/whitelist.txt
    log "检测到whitelist.txt不存在,已生成新的文件"
  fi

  if [[ -e $config/doze.txt ]]; then
    log "已跳过 替换新的doze.txt"
  else
    cp -f $FILE/config/doze.txt $config/doze.txt
    log "检测到doze.txt不存在,已生成新的文件"
  fi
else
  if [[ -e $config/whitelist.txt ]]; then
    sleep 0.5
    echo " "
    echo "--- 检测到whitelist.txt存在"
    echo "--- 是否替换新的whitelist.txt(请选择)"
    echo "-- 替换则使用新的配置,不替换则保留原来的配置"
    echo "- 按音量键＋: 替换"
    echo "- 按音量键－: 不替换"
    if [[ $(get_choose) == 0 ]]; then
      echo "已选择 替换新的whitelist.txt"
      cp -f $FILE/config/whitelist.txt $config/whitelist.txt
      log "已替换新的whitelist.txt文件"
    else
      echo "已跳过 替换新的whitelist.txt"
    fi
  else
    cp -f $FILE/config/whitelist.txt $config/whitelist.txt
    log "检测到whitelist.txt不存在,已生成新的文件"
  fi

  if [[ -e $config/doze.txt ]]; then
    sleep 0.5
    echo " "
    echo "--- 检测到doze.txt存在"
    echo "--- 是否替换新的doze.txt(请选择)"
    echo "-- 替换则使用新的配置,不替换则保留原来的配置"
    echo "- 按音量键＋: 替换"
    echo "- 按音量键－: 不替换"
    if [[ $(get_choose) == 0 ]]; then
      echo "已选择 替换新的doze.txt"
      cp -f $FILE/config/doze.txt $config/doze.txt
      log "已替换新的doze.txt文件"
    else
      log "已跳过 替换新的doze.txt"
    fi
  else
    cp -f $FILE/config/doze.txt $config/doze.txt
    log "检测到doze.txt不存在,已生成新的文件"
  fi
fi
