#!/system/bin/sh
FILE="$MODPATH/install/Replace"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

if [ ! -e $config/Replace.txt ]; then
  cp -f $FILE/config/Replace.txt $config/Replace.txt
  log "检查到Replace.txt文件不存在，已生成新文件"
fi

if [[ -e $MODPATH/folder/Inherit ]]; then
  source $config/Replace.txt
  for Replace_list in $REPLACE_1; do
    mktouch $MODPATH$Replace_list/.replace
  log "已精简: $Replace_list"
  sleep 0.05
  done
else
  echo "--- 是否应用当前的Replace.txt配置精简应用"
  echo "-- Replace.txt文件在Android/Optimization文件夹中"
  echo "-- 第一次精简建议先查看一下文件,看看有没有不需要精简的"
  echo "- 按音量键＋: 确定"
  echo "- 按音量键－: 退出安装"
  if [[ $(get_choose) == 0 ]]; then
  	source $config/Replace.txt
  	for Replace_list in $REPLACE_1; do
  		mktouch $MODPATH$Replace_list/.replace
  	log "已精简: $Replace_list"
  	sleep 0.05
  	done
  else
  	abort "- 修改完再重新安装吧~"
  fi
fi
