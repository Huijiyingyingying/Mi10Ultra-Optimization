#!/system/bin/sh
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $config/install_chose.txt

for i in $Choose; do
  if [[ $i = "Doze_True" ]]; then
    Choose_Doze="True"
  elif [[ $i = "Doze_False" ]]; then
    Choose_Doze="False"
  elif [[ $i = "Whitelist_True" ]]; then
    Choose_Whitelist="True"
  elif [[ $i = "Whitelist_False" ]]; then
    Choose_Whitelist="False"
  fi
done

if [[ $Choose_Doze = "True" || $Choose_Whitelist = "True" ]]; then
  if pidof -x "Whitelist.sh" >/dev/null; then
    echo "Whitelist脚本已经在运行,无需再唤醒"
  else
    sh $FILE/script/Doze.sh &
    echo "已唤醒Whitelist脚本"
  fi
else
  echo "模块没有安装Whitelist脚本功能,无法唤醒Whitelist脚本"
fi
