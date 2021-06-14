#!/system/bin/sh
config="/sdcard/Android/Optimization"
date="/system/bin/date"
log() {
  time=$($date "+%H:%M:%S")
  data=$($date "+%Y-%m-%d")
  txt=".txt"
  if [ ! -d $config/log ]; then
  	mkdir -p $config/log
  fi
  if [ ! -f $config/log/$data$txt ]; then
    mktouch $config/log/$data$txt
  fi
	echo "$time $1" >> $config/log/$data$txt
  number=0
  for i in $config/log/*; do
    number=`expr $number + 1`
  done
  if [[ $number -ge 31 ]]; then
    echo "$time 检测到log文件夹已有31个日志文件" >> $config/log/$data$txt
    find $config/log -mtime +30 -type f -name *.txt | xargs rm -rf
    echo "$time 已成功清除30天之前的日志..." >> $config/log/$data$txt
  fi
}
