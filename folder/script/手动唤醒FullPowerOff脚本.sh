#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $config/install_chose.txt
for i in $Choose; do
  if [[ $i = "FullPowerOff_True" ]]; then
    Choose_FullPowerOff="True"
  elif [[ $i = "FullPowerOff_False" ]]; then
    Choose_FullPowerOff="False"
  fi
done

if [[ $Choose_FullPowerOff = "True" ]]; then
  if pidof -x "FullPowerOff.sh" >/dev/null; then
    echo "FullPowerOff脚本已经在运行,无需再唤醒"
  else
    sh $FILE/script/FullPowerOff.sh &
    echo "已唤醒FullPowerOff脚本"
  fi
else
  echo "模块没有安装FullPowerOff脚本功能,无法唤醒FullPowerOff脚本"
fi
