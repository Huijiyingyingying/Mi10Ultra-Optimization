#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $config/install_chose.txt
for i in $Choose; do
  if [[ $i = "Doze_True" ]]; then
    Choose_Doze="True"
  elif [[ $i = "Doze_False" ]]; then
    Choose_Doze="False"
  fi
done

if [[ $Choose_Doze = "True" ]]; then
  if pidof -x "Doze.sh" >/dev/null; then
    echo "Doze脚本已经在运行,无需再唤醒"
  else
    sh $FILE/script/Doze.sh &
    echo "已唤醒Doze脚本"
  fi
else
  echo "模块没有安装Doze脚本功能,无法唤醒Doze脚本"
fi
