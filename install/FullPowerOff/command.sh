#!/system/bin/sh
FILE="$MODPATH/install/FullPowerOff"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

cp -af $FILE/script/* $MODPATH/script/

echo "chown root:root $FILE2/script/FullPowerOff.sh" >> $MODPATH/service.sh
echo "chmod 777 $FILE2/script/FullPowerOff.sh" >> $MODPATH/service.sh
echo "nohup $FILE2/script/FullPowerOff.sh &" >> $MODPATH/service.sh
