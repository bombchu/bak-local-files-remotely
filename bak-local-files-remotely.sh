#!/bin/bash

datevao="$(date +%Y-%m-%d)"

mydir="$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)"

history > bash-history-$datevao.txt

printf "about to ssh\n"

ssh -i ~/work-2019-06.pem ubuntu@172.31.7.21 mkdir -pv $mydir

# printf "\nabout to scp\n"

# scp -i ~/work-2019-06.pem bash-history-$datevao.txt ubuntu@172.31.7.21:~/$mydir/

printf "\nabout to rsync\n"

rsync -aAxXHe "ssh -i ~/work-2019-06.pem" --max-delete=-1 --no-compress --stats ~/* ubuntu@172.31.7.21:~/$mydir/

printf "\n DONE\n"
