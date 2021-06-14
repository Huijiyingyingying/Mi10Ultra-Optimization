#!/system/bin/sh
SKIPUNZIP=0
MODEL="$(getprop ro.product.device)"
[[ $MODEL != cas ]] && abort "- 此模块仅支持小米10Ultra"
source $MODPATH/function.sh

config="/sdcard/Android/Optimization"
FILE="/data/adb/modules/Mi10Ultra-Optimization"

if [ ! -d $config ]; then
	mkdir -p $config
fi
rm -f $config/install_log.txt
mktouch $config/install_log.txt

#module.prop
id="Mi10Ultra-Optimization"
name="Mi10Ultra专属优化"
version="v4.6.6(21.6.14)"
versionCode="20210614"
author="灰机嘤嘤嘤"
description="仅针对小米10至尊纪念版优化  已安装功能: "

mkdir $MODPATH/system
mktouch $MODPATH/system.prop
mktouch $MODPATH/post-fs-data.sh

#输出更新日志
updateLog=$(cat $MODPATH/README.md)
echo "--- 更新日志"
echo $updateLog

sleep 0.25

echo "- 3s后刷入本模块..."
sleep 3

#选择安装功能
if [ -f $config/install_chose.txt ]; then
	source $config/install_chose.txt
  number=0
	for i in $Choose; do
		number=`expr $number + 1`
	done
	log "已检测出上次选择安装的功能共有 $number 个"
	number2=0
	for i in $MODPATH/install/*; do
		source $i/install.sh
		if [[ $Install_Subfunction = "True" ]]; then
			number2=`expr $number2 + 1`
		fi
		number2=`expr $number2 + 1`
	done
	log "本次安装功能共有 $number2 个"
	if [[ $number = $number2 ]]; then
		echo " "
		echo "--- 检测到install_chose.txt存在"
		echo "--- 是否应用上一次的选择配置(请选择)"
		echo "- 按音量键＋: 应用"
		echo "- 按音量键－: 不应用"
		if [[ $(get_choose) == 0 ]]; then
			echo "- 已选择 应用上一次的选择配置"
			mktouch $MODPATH/folder/Inherit
			Install_Inherit
		else
			echo "- 已跳过 应用上一次的选择配置"
			mktouch $config/install_chose.txt
			echo 'Choose=""' > $config/install_chose.txt
			log "已清理上一次的选择配置文件"
			sleep 0.5
			Install_Start
		fi
	else
		echo "- 该版本有功能增加,已跳过应用上次的选择配置安装"
		mktouch $config/install_chose.txt
		echo 'Choose=""' > $config/install_chose.txt
		Install_Start
	fi
else
	mktouch $config/install_chose.txt
	echo 'Choose=""' > $config/install_chose.txt
	Install_Start
fi

#生成小脚本
[[ -d $config/script ]] && rm -rf $config/script
mkdir $config/script
cp -f $MODPATH/folder/script/* $config/script/
log "已生成小脚本"
echo "- 小脚本位于Android/Optimization/script文件夹中"

#写入module.prop
echo "#module.prop
id=$id
name=$name
version=$version
versionCode=$versionCode
author=$author
description=$description" > $MODPATH/module.prop

#删除临时文件
rm -rf $MODPATH/install
rm -rf $MODPATH/folder
rm -f $MODPATH/function.sh
log "删除临时文件完成"

echo "exit 0" >> $MODPATH/service.sh