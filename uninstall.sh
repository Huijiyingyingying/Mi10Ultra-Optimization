#!/system/bin/sh
MODDIR=${0%/*}
config="/sdcard/Android/Optimization"
date="/system/bin/date"

uninstall_recover() {
  rm -rf $1
  touch $1
  chmod 644 $1
}

log() {
  time=$($date "+%H:%M:%S")
	echo "$time $1" >> $config/uninstall_log.txt
}

# 清理缓存
rm -rf /data/system/package_cache/*
log "清理缓存"
