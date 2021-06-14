#!/system/bin/sh

get_choose() {
	local choose
	local branch
	while :; do
		choose="$(getevent -qlc 1 | awk '{ print $3 }')"
		case "$choose" in
		KEY_VOLUMEUP)  branch="0" ;;
		KEY_VOLUMEDOWN)  branch="1" ;;
		*)  continue ;;
		esac
		echo "$branch"
		break
	done
}

Permission_setting() {
	rm -rf $1
	touch $1
	chmod 000 $1
	sleep 0.05
}

#log Msg
log() {
	date="/system/bin/date"
	time=$($date "+%H:%M:%S")
	echo "$time $1" >> /sdcard/Android/Optimization/install_log.txt
	echo "- $1"
}

#Install_Select Install_Code
Install_Select() {
	Folder="$MODPATH/install/$1"
	source $Folder/install.sh
	if [ $Install_Condition = "True" ]; then
		source $Folder/condition.sh
		if [ $Install_Condition_log = "False" ]; then
			set_item $1 "False"
			return
		fi
	fi
	Install_Function $1 $Install_Name $Folder "False"
	if [ $Install_description != "" ]; then
		description="$description[$Install_description]"
	fi
	if [ $Install_Subfunction = "True" ]; then
		if [ $Install_SubCondition = "True" ]; then
			source $Folder/sub/condition.sh
			if [ $Install_Condition_log = "False" ]; then
				set_item $Install_SubCode "False"
				return
			fi
		fi
	  Install_Function $Install_SubCode $Install_SubName "$Folder/sub" "True"
		if [ $Install_Subdescription != "" ]; then
			description="$description[$Install_Subdescription]"
		fi
	fi
}

#Install_Function Code Name Folder SubOrNotSub(True/False)
Install_Function() {
	echo " "
	echo "--- 功能：$2(请选择)"
	if [ $4 = "True" ]; then
		for i in $Install_SubMsg; do
			echo "-- $i"
		done
	else
		for i in $Install_Msg; do
			echo "-- $i"
		done
	fi
	echo "- 按音量键＋: 安装"
	echo "- 按音量键－: 不安装"
	if [[ $(get_choose) == 0 ]]; then
		set_item $1 "True"
		log "已选择 安装$2"
		sleep 0.25
		log "正在安装$2"
		sleep 0.25
		. $3/command.sh
		log "已安装完成$2"
		sleep 0.5
	else
		set_item $1 "False"
		log "已跳过 安装$2"
		sleep 0.5
		return
	fi
}

#Install_Function2 Name Folder
Install_Function2() {
	log "正在安装$1"
	sleep 0.25
	. $2/command.sh
	log "已安装完成$1"
	sleep 0.5
}

Install_Start() {
	for i in $MODPATH/install/*; do
		a=`basename $i`
	  if [ $files = "" ]; then
		 files="$a"
	 else
	   files="$files
		 $a"
	 fi
 done
	for i in $files; do
		Install_Select $i
	done
}

#set_item 变量 True/False
set_item() {
	source /sdcard/Android/Optimization/install_chose.txt
	if [ $Choose = "" ]; then
		echo 'Choose="'$1'_'$2'"' > /sdcard/Android/Optimization/install_chose.txt
	else
		echo 'Choose="'$Choose'' > /sdcard/Android/Optimization/install_chose.txt
		echo ''$1'_'$2'"' >> /sdcard/Android/Optimization/install_chose.txt
	fi
}

Install_Inherit() {
	source /sdcard/Android/Optimization/install_chose.txt
	for i in $Choose; do
		if [ ${i%%_*} = "Sub" ]; then
			if [ ${i##*_} = "True" ]; then
				a=${i#*_}
				Install_Code=${a%_*}
				source "$MODPATH/install/$Install_Code/install.sh"
				Folder="$MODPATH/install/$Install_Code/sub"
				Install_Function2 $Install_SubName $Folder
				if [ $Install_Subdescription != "" ]; then
					description="$description[$Install_Subdescription]"
				fi
			fi
		else
			if [ ${i##*_} = "True" ]; then
				Install_Code=${i%%_*}
				Folder="$MODPATH/install/$Install_Code"
				source $Folder/install.sh
				Install_Function2 $Install_Name $Folder
				if [ $Install_description != "" ]; then
					description="$description[$Install_description]"
				fi
			fi
		fi
	done
}
