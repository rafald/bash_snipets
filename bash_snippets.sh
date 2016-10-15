{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}
tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
          oops "Can\'t create temporary directory for downloading the Nix binary tarball")"
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM


# had problem that CD/DVD drive changes /new disk loaded/ were not recognised by ubuntu, following helped
eject -a on /dev/sr0 # or eject -a off /dev/sr0

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}
...

} # End of wrapping

# Monitor files opened by process 4182
watch ls -l /proc/4182/fd
watch ls -l /proc/$$/fd # for current bash script/shell

# File operations performed by process started via strace
strace -f -t -e trace=open,close,getdents,connect,accept,read ~/fbig_files.sh / > /dev/null
# note -f flag = trace forked children

# For find, you will need to test if any output was generated. -n tests for a non-empty string:
if [[ -n $(find /var/log/crashes -name "app-*.log" -mmin -5) ]]

# copy file with I/.O errors
dd if=corrupted-file.wmv of=corrupted-file-CLEAN.wmv conv=noerror,sync

# block by block copy of corrupted hdd
# Assuming your new-HDD (/dev/disk2) is of equal or greater size than your corrupt-HDD (/dev/disk1), then you can issue:
dd if=/dev/disk1 of=/dev/disk2 bs=4096 conv=notrunc,noerror
# blocksized @ 4k, don't truncate any data blocks, ignore all errors

#subtract numeric values
FIRSTV=`ls -1 | wc -l`
cd ..
SECONDV=`ls -1 | wc -l`
COUNT=$(($FIRSTV-$SECONDV))
let "t = a<7?7:11"   # False
#The let command can, in certain contexts, return a surprising exit status.
# Evgeniy Ivanov points out:
var=0
echo $?     # 0
            # As expected.
let var++
echo $?     # 1
            # The command was successful, so why isn't $?=0 ???
            # Anomaly!
#  However, as Jeff Gorak points out,
#+ this is part of the design spec for 'let' . . .
# "If the last ARG evaluates to 0, let returns 1;
#  let returns 0 otherwise." ['help let']

# epoch - seconds from 1970 e.g. 1463825986
date +%s

http://www.tldp.org/LDP/abs/html/io-redirection.html
   [j]<>filename
      #  Open file "filename" for reading and writing,
      #+ and assign file descriptor "j" to it.
      #  If "filename" does not exist, create it.
      #  If file descriptor "j" is not specified, default to fd 0, stdin.
      #
      #  An application of this is writing at a specified place in a file. 
      echo 1234567890 > File    # Write string to "File".
      exec 3<> File             # Open "File" and assign fd 3 to it.
      read -n 4 <&3             # Read only 4 characters.
      echo -n . >&3             # Write a decimal point there.
      exec 3>&-                 # Close fd 3.
      cat File                  # ==> 1234.67890
      #  Random access, by golly.

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

