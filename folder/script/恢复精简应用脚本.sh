#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

if [ ! -e $config/script/config/Replace.txt ]; then
  log "检查到Replace.txt文件不存在，退出安装"
  exit 0
fi

echo "--- 是否应用当前的Replace.txt配置精简应用"
echo "-- Replace.txt文件在Android/Optimization/script/config文件夹中"
echo "- 按音量键＋: 确定"
echo "- 按音量键－: 退出脚本"
if [[ $(get_choose) == 0 ]]; then
  source $config/script/config/Replace.txt
  for Replace_list in $REPLACE_1; do
    rm -rf $FILE$Replace_list
  log "已恢复: $Replace_list"
  sleep 0.05
  done
else
  exit 0
fi
