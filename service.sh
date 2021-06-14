#!/system/bin/sh
MODDIR=${0%/*}
sdcard_rw()
{
	local test_file="/sdcard/Android/.TEST_FILE"
	touch $test_file
	while [[ ! -f $test_file ]]; do
		touch $test_file
		sleep 1
	done
	rm $test_file
}
sdcard_rw
FILE="/data/adb/modules/Mi10Ultra-Optimization"
config="/sdcard/Android/Optimization"
source $FILE/script/log.sh
