#!/bin/bash

## add this script to crontab for auto upload of releases added to a specified directory
## 
## remember to do a chmod +x autoupload.sh
## Run with -v for the world smallest debug 
##
## * * * * * /path/to/autoupload.sh >/dev/null 2>&1
##


# load the media_watch_location from config.env
export $(grep '^media_watch_location' config.env | xargs -d '\n')
if [ -z $media_watch_location ]; then
  echo "media_watch_location not set in config.env"
  exit 1
fi

# find location of this script and locate the auto_upload.py in same diretory
script_path=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
uploadscript="$script_path/auto_upload.py"

pid_file="/tmp/autoupload.pid"


_V=0
while getopts "v" OPTION
do
  case $OPTION in
    v) _V=1
       ;;
  esac
done


trap 'rm -f "$pid_file"; exit 0' SIGINT SIGTERM

if [ -f $pid_file ]; then
    echo "Found existing .pid file named $pid_file. Checking."

    # check the pid to see if the process exists
    pgrep -F $pid_file
    pid_is_stale=$?
    old_pid=$( cat $pid_file )
    echo "pgrep check on existing .pid file returned exit status: $pid_is_stale"

    if [ $pid_is_stale -eq 1 ]; then
      echo "PID $old_pid is stale. Removing file and continuing."
      rm $pid_file
    else 
      echo "PID $old_pid is still running or pgrep check errored. Exiting."
      exit
    fi
else 
    echo "Creating .pid file $pid_file"
    echo $$ > $pid_file
fi

#only print if we are in verbose mode
function log () { 
    if [[ $_V -eq 1 ]]; then 
        echo "$@" 
    fi 
}

while true
do
  for directory in $media_watch_location/*; do
    if [ -d "$directory" ]; then
      if [[ "$directory" != *failed-* ]]; then
        # Will not run if no directories are available
        log "running for $directory"
        python3 $uploadscript -p $directory -auto
      fi
    fi
  done
done

rm -f "$pid_file"
trap - SIGINT SIGTERM
