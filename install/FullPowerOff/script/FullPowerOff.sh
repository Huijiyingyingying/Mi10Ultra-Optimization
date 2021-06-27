#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $FILE/script/log.sh

log "充满自动断电脚本已运行"

Folder=/sys/class/power_supply/battery/input_suspend
Folder2=/sys/class/power_supply/battery/charging_enabled
Power=/sys/class/power_supply/battery/capacity
Status=0
Status2=1

unset a b

until false; do
	source $config/FullPowerOff.txt
	sleep $Script_Delay
	[[ -f $Folder ]] && Status=`cat $Folder`
	[[ -f $Folder2 ]] && Status2=`cat $Folder2`
	if [[ $(cat $Power) -ge $Power_Stop ]]; then
		if [[ $Status = 0 || $Status2 = 1 ]]; then
			 if [[ -n $a ]]; then
				 a=$a
			 elif [[ -z $a ]]; then
				 log "当前电量为 $(cat $Power)% ,已达到(或大于) $Power_Stop$% ,等待 $Power_Stop_Delay 执行禁止充电命令..."
			 	 sleep $Power_Stop_Delay
				 [[ -f $Folder ]] && echo 1 >$Folder
				 [[ -f $Folder2 ]] && echo 0 >$Folder
				 a=1
				 unset b
				 log "已禁止充电,当电池电量为 $Power_Restore% 时,执行恢复充电命令..."
			 fi
		 fi
	 elif [[ $(cat $Power) -le 95 ]]; then
		 if [[ $Status = 1 || $Status2 = 0 ]]; then
			 if [[ -n $b ]]; then
				 b=$b
			 elif [[ -z $b ]]; then
				 [[ -f $Folder ]] && echo 0 >$Folder
				 [[ -f $Folder2 ]] && echo 1 >$Folder2
				 b=1
				 unset a
				 log "当前电量为 $(cat $Power)% , 已达到(或小于) $Power_Restore% ,已恢复充电..."
			 fi
		 fi
	 fi
done
