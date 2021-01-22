#!/bin/bash

if [ ! -z "${MOUNT}" ]; then
   cd /${MOUNT}/app/oracle/scripts
else
   echo "{MOUNT} is null or is not defined"
   exit
fi

#-------------------------------------------------
# Output routine - Writes timestamp + user info + text to logfile
StatusOut () {
	NOW=$(date +"%Y-%m-%d %H:%M:%S")
	USERINFO=$(who am i | awk '{USR=substr($1,1,10);
	                          TRM=substr($2,1,10);
	                          MNT=substr($3,1,10);
	                          DAY=substr($4,1,10);
	                          TIM=substr($5,1,10);
	                          printf("%s %s %s %s %s", USR,TRM,MNT,DAY,TIM)}');
	CURUSER=$(whoami)
	printf "[%s${NOW} user: %s${USERINFO} acting as: %s${CURUSER}] %s$1 \n" >> $0".log"
}
#-------------------------------------------------

StatusOut "Start file $1 processing by $0 script"
export QUEUE_NAME="SERVICE_CALL_QUEUE"
export QUEUE_OPERATION="resumeConsumption"
StatusOut "Begin operation $QUEUE_OPERATION for queue $QUEUE_NAME"
/${MOUNT}/software/scripts/runWLST.sh /${MOUNT}/app/oracle/scripts/pause-queue.py
StatusOut "End operation $QUEUE_OPERATION for queue $QUEUE_NAME"
unset QUEUE_NAME
unset QUEUE_OPERATION
StatusOut "End file $1 processing by $0 script"
