#!/bin/bash
#####################################################################
#       AUTHOR:  <sander@thisonewasavailable.com>
#      VERSION:  1.1
#      CREATED:  2013-02-19
#     REVISION:  2017-06-06
##################################################################### 
#   2017-06-06:  Integrated host-specific actions to keep me from
#                having to maintain multiple versions of this script
##################################################################### 
#  2018-05-10:   Added zeepi to the list of hosts
##################################################################### 

DATUM=$(date +%Y%m%d)
ME=$(whoami)

if [ ! -d ~/Testing/todo_old ]; then
  mkdir -p ~/Testing/todo_old
  mkdir -p ~/Documents/notes/
  mkdir -p ~/Documents/data/
fi

crontab -l > /home/${ME}/Testing/todo_old/crontab${DATUM}.txt
touch ~/Testing/.notempty
find ~/Testing/ -type f -mtime +69 -delete \
             -o -type d -empty -delete

if [[ $(hostname) == 'lune.thisonewasavailable.com' ]]; then
  cp ~/Documents/notes/todo.txt ~/Testing/todo_old/todo${DATUM}.txt
  rm -f ~/sent
  rm -rf ~/LOG_imapsync
fi

if [[ $(hostname) == 'zeepi' ]]; then
  cat /home/${ME}/.vimrc > /home/${ME}/Scripts/vimrc.bkup
  cat /home/${ME}/.bashrc > /home/${ME}/Scripts/bashrc.bkup
fi
