#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"
source $FILE/script/log.sh

log "自动杀死QQ/微信无用进程脚本已启动"

pose="
com.tencent.mm:sandbox*
com.tencent.mm:exdevice*
com.tencent.mobileqq:tool*
com.tencent.mobileqq:qzone*
com.tencent.mm:tools*
com.tencent.mobileqq:TMAssistantDownloadSDKService*
com.tencent.mobileqq:mini*
com.tencent.mm:hotpot*
com.tencent.mobileqq:hotpot*
"

function topapp(){
	app=$(dumpsys window | grep mCurrentFocus | egrep -o "[^ ]*/[^\\}]+" | cut -d/ -f1 )
	echo "$app"
}

function killapp(){
for i in $pose;do
		pgrep -f "$i" | while read PID;do
		test "$(topapp)" = "com.tencent.mm" && break
		test "$(topapp)" = "com.tencent.mobileqq" && break
		kill -9 "$PID"
	done
done
}

until false; do
  sleep 60
  topapp
  if test "$(topapp)" != "com.tencent.mm" -a "$(topapp)" != "com.tencent.mobileqq" ;then
    killapp
  fi
done
