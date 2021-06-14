#!/system/bin/sh
FILE="$MODPATH/install/TcpOptimization"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

echo 'echo 2 > /proc/sys/net/ipv4/tcp_fin_timeout' >> $MODPATH/service.sh
echo 'echo 0 > /proc/sys/net/ipv4/tcp_keepalive_time' >> $MODPATH/service.sh
echo 'echo 2 > /proc/sys/net/ipv4/tcp_keepalive_probes' >> $MODPATH/service.sh
echo 'echo 2 > /proc/sys/net/ipv4/tcp_keepalive_intvl' >> $MODPATH/service.sh
echo 'echo 0 > /proc/sys/net/ipv4/tcp_timestamps' >> $MODPATH/service.sh
echo 'echo 3 > /proc/sys/net/ipv4/tcp_fastopen' >> $MODPATH/service.sh
echo 'echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse' >> $MODPATH/service.sh
echo 'echo 0 > /proc/sys/net/ipv4/tcp_slow_start_after_idle' >> $MODPATH/service.sh
echo 'echo 1048576 > /proc/sys/net/core/rmem_default' >> $MODPATH/service.sh
echo 'echo 1048576 > /proc/sys/net/core/wmem_default' >> $MODPATH/service.sh
echo 'log "修改TCP参数成功"' >> $MODPATH/service.sh
