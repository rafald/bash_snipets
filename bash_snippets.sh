# change filesystem from readonly to writeable
sudo mount -o remount,rw '/media/raf12/GParted-live'
# but there is no free space after remount altough disk is now rw

sudo mount -t udf -o uid=$(id -u) /dev/sdb1 /media/raf12/GParted-live



#create boot repair disk
sudo dd if=boot-repair-disk-64bit.iso of=/dev/sdb bs=4M; sync


