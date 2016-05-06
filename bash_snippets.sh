# google translate shell
# how to grab content from internet and feed it via a file
gawk -f <(curl -Ls git.io/translate) -shell


# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi



# instead less use vim to browse archives - works with zip archives not as less

# change filesystem from readonly to writeable
sudo mount -o remount,rw '/media/raf12/GParted-live'
# but there is no free space after remount altough disk is now rw

sudo mount -t udf -o uid=$(id -u) /dev/sdb1 /media/raf12/GParted-live



#create boot repair disk
sudo dd if=boot-repair-disk-64bit.iso of=/dev/sdb bs=4M; sync


# Restore sound settings
/usr/bin/amixer set Master,0 100%,100% unmute
/usr/bin/amixer set PCM,0 100%,100% unmute
/usr/bin/amixer set Line,0 100%,100% mute captur
/usr/bin/amixer set Capture,0 100%,100% captur
/usr/bin/aplay /usr/share/sounds/purple/login.wav &



#echo "--yes-playlist --dump-intermediate-pages --write-pages --print-traffic --call-home --extract-audio --recode-video --embed-subs --embed-thumbnail --add-metadata --exec 'adb push {} /sdcard/Music/ && rm {}' --write-description --write-info-json --write-annotations "
: ${PROXY:=--proxy=127.0.0.1:8123}
: ${Q:=22}
echo "--embed-subs --convert-subtitles=srt "
youtube-dl ${PROXY} -t --restrict-filenames -c --sub-lang 'en,de,pl' --write-sub --write-auto-sub -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]' $@ --merge-output-format mp4


# etraction extension of filename
~% FILE="example.tar.gz"
~% echo "${FILE%%.*}"
example
~% echo "${FILE%.*}"
example.tar
~% echo "${FILE#*.}"
tar.gz
~% echo "${FILE##*.}"
gz

