#!/system/bin/sh
FILE="$MODPATH/install/OtherOptimization"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

#关闭强制使用软件GLES渲染
echo "persist.sys.force_sw_gles=0" >> $MODPATH/system.prop

#关闭ramdump
echo "persist.vendor.ssr.enable_ramdumps=0
persist.vendor.ssr.enable_mini_ramdumps=0" >> $MODPATH/system.prop

#开启同用宽带压缩UBWC（可降低屏幕功耗，需设备支持）
echo "debug.gralloc.enable_fb_ubwc=1" >> $MODPATH/system.prop

#开启大TCP数据包（可提升移动网络网速）
echo "ro.data.large_tcp_window_size=true" >> $MODPATH/system.prop

#开启优化SurfaceFlinger缓冲区
echo "debug.sf.latch_unsignaled=1
debug.sf.disable_backpressure=1
windowsmgr.max_events_per_sec=1000" >> $MODPATH/system.prop

#VM 虚拟堆大小（Dalvik优化）; 提高 RAM
echo "dalvik.vm.startheapsize=512m
dalvik.vm.heapsize=512m
dalvik.vm.execution-mode=int:fast
dalvik.vm.dexopt-flags=v=n,o=v
dalvik.vm.verify-bytecode=false
dalvik.vm.checkjni=false
dalvik.vm.heaptargetutilization=0.85
dalvik.vm.heapmaxfree=4m
dalvik.vm.heapgrowthlimit=256m" >> $MODPATH/system.prop

#开启移动数据省电模式
echo "persist.vendor.radio.add_power_save=1" >> $MODPATH/system.prop

#开启小米GNSS增强选项
setprop persist.vendor.gnss.hpLocSetUI 1
echo "setprop persist.vendor.gnss.hpLocSetUI 0" >> $MODPATH/uninstall.sh

#减轻低内存Kill后台机制
if [[ -f "$2" ]];then
    chmod 0777 "$2" 2>/dev/null
    chmod u+x "$2" 2>/dev/null
    echo "$1" > "$2" && chmod 0644 "$2" || log "修改"$2"失败！"
fi

set_value 0 /sys/module/lowmemorykiller/parameters/enable_lmk
set_value 0 /sys/module/lowmemorykiller/parameters/debug_level

#内存调控
echo "ro.vendor.qti.sys.fw.bg_apps_limit=600
ro.vendor.qti.sys.fw.bservice_enable=true
ro.vendor.qti.sys.fw.bservice_limit=20
persist.service.crash.enable=0
ro.vendor.qti.sys.fw.use_trim_settings=false"  >> $MODPATH/system.prop

#加快安装应用速度
echo "ro.miui.pm.install.speedinstall=/data/apk-tmp" >> $MODPATH/system.prop

#开启iorap功能(加快应用冷启动)
echo "ro.iorapd.enable=true
iorapd.perfetto.enable=true
iorapd.readahead.enable=true
ro.vendor.perf.scroll_opt=true"  >> $MODPATH/system.prop
