#!/system/bin/sh
FILE="$MODPATH/install/Whitelist"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

source $config/install_chose.txt
for i in $Choose; do
  if [ $i = "Doze_True" ]; then
    Choose_Doze="True"
  fi
  if [ $i = "Doze_False" ]; then
    Choose_Doze="False"
  fi
done
if [ $Choose_Doze = "True" ]; then
  Install_Condition_log="False"
fi
if [ $Choose_Doze = "False" ]; then
  Install_Condition_log="True"
fi
