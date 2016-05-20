#!/bin/bash

## 部署
function deploy(){
    printf "\nready to deployment ->${IP}:${REMOTE_PROJECT_PATH}"
    ## 创建远程文件夹
    ssh "${REMOTE_USER}@${IP}" "mkdir -p ${REMOTE_PROJECT_PATH}"
    ## 真正的同步目录
    rsync  ${RSYNC_OPTION} . ${REMOTE_USER}@${IP}:${REMOTE_PROJECT_PATH}
    ##
    printf "\nready to restart remote:(ssh ${REMOTE_USER}@${IP}:${REMOTE_RESTART_SCRIPT})\n"
    ## 远程重启脚本
    ssh "${REMOTE_USER}@${IP}" "bash ${REMOTE_RESTART_SCRIPT}"
}

## 检查空
function chkVariable(){
    if [ "$1" == "" ]; then
        printf "ERROR! you must config at least \n[ PROJECT_NAME ; LOCAL_PROJECT_PATH; REMOTE_PROJECT_PATH ] variable in config.sh and \n[ ENV ; IP ] variable in the restart-*.sh file\n"
        exit
    fi
}
#color
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
#加载配置文件
source "$( cd $(dirname $0) ; pwd -P )/config.sh"
#打印配置信息
echo "===============Configuration[start]================="
printf '%10s%-25s=%-5s\n' "" "PROJECT_NAM"  "${RED}${PROJECT_NAME}${NORMAL}"
printf '%10s%-25s=%-5s\n' "" "LOCAL_PROJECT_PATH" "${RED}${LOCAL_PROJECT_PATH}${NORMAL}"
printf '%10s%-25s=%-5s\n' "" "REMOTE_PROJECT_PATH" "${RED}${REMOTE_PROJECT_PATH}${NORMAL}"
printf '%10s%-25s=%-5s\n' "" "IP" "${RED}${IP}${NORMAL}"
printf '%10s%-25s=%-5s\n' "" "ENV" "${RED}${ENV}${NORMAL}"
echo "===============Configuration[end]==================="

# "在调用这个脚本之前一定要初始化下面的变量！"
chkVariable ${PROJECT_NAME}
chkVariable ${LOCAL_PROJECT_PATH}
chkVariable ${REMOTE_PROJECT_PATH}
chkVariable ${IP}
chkVariable ${ENV}
chkVariable ${RSYNC_OPTION}

## 远程重启脚本路径
REMOTE_RESTART_SCRIPT="${REMOTE_PROJECT_PATH}/bin/restart-${ENV}.sh"

##
## 同步本地和远程文件夹
echo "compare local:${LOCAL_PROJECT_PATH} <=> ${IP}:${REMOTE_PROJECT_PATH}"

## 项目根目录
cd ${LOCAL_PROJECT_PATH}

## 准备比较本地目录和远程发布目录的区别， -n是不操作。
echo "rsync -n ${RSYNC_OPTION} . ${REMOTE_USER}@${IP}:${REMOTE_PROJECT_PATH}"
## 同步 --delete 是删除远程有的本地没有的,-n 没有真正操作
rsync -n ${RSYNC_OPTION} . ${REMOTE_USER}@${IP}:${REMOTE_PROJECT_PATH}

## 同步前和发布者确定一次？
printf  "Ensure to deploy to ${RED}[${ENV}] ${IP}:${REMOTE_PROJECT_PATH}?${NORMAL}\n"
## 提示输入确认
select yn in "Ensure Deploy" "Cancel"; do
    case $yn in
        "Ensure Deploy" )
            deploy
            break;;
        "Cancel" ) echo "Cancel Deployment！"; exit;;
    esac
done
