#!/system/bin/sh
FILE="$MODPATH/install/WifiBonding"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
array=$(find /system /vendor -name WCNSS_qcom_cfg.ini)
for CFG in $array; do
  [[ -f $CFG ]] && [[ ! -L $CFG ]] && {
    SELECTPATH=$CFG
    log "已找到文件 $MIRRORPATH$SELECTPATH"
    mkdir -p `dirname $MODPATH/system$CFG`
    cp -af $MIRRORPATH$SELECTPATH $MODPATH/system$SELECTPATH
    sed -i '/gChannelBondingMode24GHz=/d;/gChannelBondingMode5GHz=/d;/gForce1x1Exception=/d;s/^END$/gChannelBondingMode24GHz=1\ngChannelBondingMode5GHz=1\ngForce1x1Exception=0\nEND/g' $MODPATH/system$SELECTPATH
    log "已修改文件 /system$SELECTPATH"
  }
done
