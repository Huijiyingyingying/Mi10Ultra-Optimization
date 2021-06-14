#!/system/bin/sh
FILE="$MODPATH/install/RAMOptimization"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

mulu="/sdcard/Android/data"

#Process_Start MainProcess
Process_Start() {
	if [[ -e $mulu/$1 ]]; then
		log "已检测到本机存在 $1 应用"
		source "$FILE/folder/$1"
		for i in $Process_list; do
			pm disable $1/$Process_list
			log "已禁用 $i"
			sleep 0.05
		done
		echo 'Process_list="'$Process_list'"' >> $MODPATH/uninstall.sh
		echo 'for i in $Process_list; do
			pm enable '$1'/$i
			log "已恢复 $i
			sleep 0.05"
		done' >> $MODPATH/uninstall.sh
	else
		log "未检测到本机安装 $1 应用"
	fi
}

#com.tencent.mobileqq
Process_Start "com.tencent.mobileqq"

#com.tencent.tim
Process_Start "com.tencent.tim"

#com.tencent.mm
Process_Start "com.tencent.mm"

#com.eg.android.AlipayGphone
Process_Start "com.eg.android.AlipayGphone"

#com.netease.cloudmusic
Process_Start "com.netease.cloudmusic"
