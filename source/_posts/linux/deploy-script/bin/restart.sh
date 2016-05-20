#!/bin/bash
#gloabal setting
source "$( cd $(dirname $0) ; pwd -P )"/config.sh
## 检查空
function chkVariable(){
    if [ "$1" == "" ]; then
        printf "ERROR! you must config at least \n[ PROJECT_NAME ; LOCAL_PROJECT_PATH; REMOTE_PROJECT_PATH ] variable in config.sh and \n[ ENV ; IP ] variable in the restart-*.sh file\n"
        exit
    fi
}
## pid
function chkPid(){
    pid=`pgrep -f ${JAR_MAIN}`
}
#
chkVariable ${PROJECT_NAME}

JAR_MAIN="${PROJECT_NAME}.jar"
## 额外命令行传入的参数
JAVA_OPTS=`echo $*|cut -d ' ' -f 2-`
##
chkPid
## 如果存在提示是否删除
if [ "$pid" != "" ]; then
    copyPid=$pid
    ## print jar
    ps aux|grep "${JAR_MAIN}"|grep -v grep
    ## echo
    printf "\nSure to Kill ${JAR_MAIN} : [$pid] ?\n"
    ## select
    select yn in "Kill" "Cancel"; do
    case $yn in
        "Kill" )
            ## kill
            pkill -9 -f ${JAR_MAIN}
            ## chkpid
            chkPid
            ##
            if [ "$pid" = "" ]; then
                echo "Success Killed ${JAR_MAIN}[${copyPid}]"
            else
                echo "Fail Killed ${copyPid}"
                exit
            fi

            break;;
        "Cancel" ) echo "Cancel Deployment！"; exit;;
    esac
done
fi

echo "cd ${REMOTE_PROJECT_PATH} &&nohup java  ${JAVA_ARGS} ${JAVA_OPTS} -jar ${JAR_MAIN} >/dev/null 2>&1 &"
## 进入项目根目录
cd ${REMOTE_PROJECT_PATH}
## 后台启动java
nohup java ${JAVA_ARGS} ${JAVA_OPTS} -jar ${JAR_MAIN} >/dev/null 2>&1 &
#check
chkPid
sleep 1s
chkPid
if [ -n "$pid" ]; then
    echo "start ${JAR_MAIN} OK![pid=${pid}]"
else
    echo "start ${JAR_MAIN} Failed!!";
fi
echo "Deploy over!"
