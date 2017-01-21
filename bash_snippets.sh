# HERE tag in pipe, good for testing
cat <<EOF | grep 'b' | tee b.txt
foo
bar
baz
EOF

# dynamic queries for awk created in bash script - parametrized by SIZE variable
QUERY="\$1>$SIZE"
echo $QUERY
split_multiline_records.sh $@ | awk $QUERY | sort -n | tr '\0' '\n'
# ??? somehow $QUERY is not $1>45 but "$1>45"

# help in bash scripts
set -e
set -o pipefail # $? == $pipestatus[-1], cmd1 exit code is in ${PIPESTATUS[0]}, cmd3 exit code in ${PIPESTATUS[2]} 
trap usage EXIT SIGINT # SIGABRT  SIGINT  SIGQUIT SIGKILL SIGTRAP  SIGTERM 
usage() {
  if [[ $? != 0 ]] ; then
     echo "USAGE:   $0 {lower bound for qualified records - number/size} {LIST of file names or - for STDIN}" i;
  fi
}

# sort multicharacted separated records, separator ist "\n\n"
# replace newline \n with \0 character so we can use sort
# watch for end record condition "\n\n" or empty line and emit "\n compressed" line
# revert \n -> \0 translation at the end processing pipeline
gawk '/^$/ {print L; L="";} /^.+$/ {L=L $0 "\0";}' $@ | sort -n | tr '\0' '\n'

awk '$1 == "on", $1 == "off"'
# prints multiline records starting with on line pattern and ending with off line pattern

gawk '/^$/ {print L; L="";} {L=L $0 "\n";}' dups.lst
# prints multiline records separated by empty line for dups.lst file

# quickly create a file (for instance to pad disk space; or use /dev/full)
dd if=/dev/zero of=${RANDOM}.dat bs=$(( 1024 * 1024 )) count=32

# quickly copy files with damaged sectors
safecopy input output

# Geany editor - Column mode selection 
# Shift-Alt and arrow keys NOTE Mouse does not worke

# enable core dump on ubuntu 
ulimit -c unlimited 
ulimit -a 
# if global change required then change /etc/security/limits.conf 
# If dump is handled by apport package 
>> cat /proc/sys/kernel/core_pattern
# or >> sysctl kernel.core_pattern
<< |/usr/libexec/abrt-hook-ccpp %s %c %p %u %g %t e
# dumps in /var/crash/
apt-get install apport
# https://wiki.ubuntu.com/DebuggingProgramCrash
# test core dump
sleep 10 &
kill -SIGSEGV %1
# for procid in core file name
sudo sysctl kernel.core_uses_pid=1

# Shift-F12 toggles byobu key-bindings so you can execute for instance htop commands like kill (F9) from byobu session

# on ubuntu how to display sys message on desktop
notify-send -u critical -a bash "moj komunikat"

Instalation script embeding jar archive
#!/usr/bin/env sh
exec java -jar  "$0" "$@"
PK...binary content follows

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

