#!/bin/bash
##Define Global Project Settings

#Project Name
PROJECT_NAME=laimi-sync-monitor
#Local Project Development Root Directory,Don't forget the last '/'！！
LOCAL_PROJECT_PATH=/d/WS/${PROJECT_NAME}/target/build/
#Remote Deploy Root Directory
REMOTE_PROJECT_PATH=/mnt/java/${PROJECT_NAME}
#Remote User
REMOTE_USER=root

#Rsync Options
RSYNC_OPTION="-crzvaP --delete --exclude logs --chmod=Du=rwx,Dgo=rx,Fu=rx,Fgo=r"
