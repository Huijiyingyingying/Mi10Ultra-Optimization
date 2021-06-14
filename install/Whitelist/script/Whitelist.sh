#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"
source $FILE/script/log.sh

if [ ! -e $config/whitelist.txt ]; then
  cp -f $FILE/config/whitelist.txt $config/whitelist.txt
  log "检查到whitelist.txt文件不存在，已生成新文件"
fi

Whitelist() {
  source $config/whitelist.txt
  for Clean_up_the_list in $(dumpsys deviceidle whitelist|awk -F ',' '{print $2}')
  do
    dumpsys deviceidle whitelist -$Clean_up_the_list
  done
  log "已清空电池优化白名单"
  for Add_to_a_list in $app
  do
    dumpsys deviceidle whitelist +$Add_to_a_list
    log "已添加 $Add_to_a_list 到电池优化白名单"
  done
}

Whitelist

sleep 3

while :; do
  source $config/whitelist.txt
  sleep $white_time
  Whitelist
done
