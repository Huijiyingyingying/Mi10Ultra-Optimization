#!/system/bin/sh
FILE="$MODPATH/install/Mi10Series"
FILE2="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"

source $MODPATH/function.sh

echo 'output() {
	[[ ! -f "$2" ]] && return 1
	chmod +w "$2" 2>/dev/null
	if ! echo "$1" > "$2" 2>/dev/null
	then
		log "Error: $2 → $1"
		return 1
	fi
		log "成功: $2 → $1"
	sleep 0.05
}' >> $MODPATH/service.sh

echo 'output "0" /proc/sys/kernel/sched_schedstats
output "off" /proc/sys/kernel/printk_devkmsg
output "0" /sys/block/sda/queue/iostats
output "0" /sys/block/sdb/queue/iostats
output "0" /sys/block/sdc/queue/iostats
output "0" /sys/block/sdd/queue/iostats
output "0" /sys/block/sde/queue/iostats
output "0" /sys/block/sdf/queue/iostats
output "0" /sys/module/binder/parameters/debug_mask
output "0" /sys/module/binder_alloc/parameters/debug_mask
output "0" /sys/module/msm_show_resume_irq/parameters/debug_mask
output "N" /sys/kernel/debug/debug_enabled
[[ -e /sys/fs/f2fs/dm-5/min_fsync_blocks ]] && output "20" /sys/fs/f2fs/dm-5/min_fsync_blocks
output "20" /sys/fs/f2fs/sda34/min_fsync_blocks
output "128" /sys/block/sda/queue/read_ahead_kb
output "36" /sys/block/sda/queue/nr_requests
output "128" /sys/block/zram0/queue/read_ahead_kb
output "36" /sys/block/zram0/queue/nr_requests
output "0" /proc/sys/vm/page-cluster
output "0" /sys/module/subsystem_restart/parameters/enable_ramdumps
output "16" /sys/block/sda/queue/iosched/quantum
output "1" /sys/block/sda/queue/iosched/back_seek_penalty
output "0" /proc/sys/vm/oom_dump_tasks' >> $MODPATH/service.sh
