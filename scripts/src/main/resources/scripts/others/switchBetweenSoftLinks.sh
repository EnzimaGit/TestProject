#!/bin/bash

if [ ! -z "${MOUNT}" ]; then
   cd /${MOUNT}/app/oracle/scripts
else
   echo "MOUNT is null or is not defined"
   exit
fi

# source the properties
. ./switchBetweenSoftLinks.properties

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

if [ "$#" -ne 1 ]; then
   echo "Illegal number of parameters"
   exit
fi

if [ "$1" != "allow-all" ] && [ "$1" != "allow-skat-only" ]; then
   echo "The programm must use one of the following arguments [allow-all || allow-skat-only]"
   exit
fi

if [ -z "$FILETRANSPORT_INPUT_DIR" ] || [ -z "$FILETRANSPORT_INPUT_DIR_SKATONLY" ] || [ -z "$ALIAS" ] || [ -z "$SCRIPT_PATH" ]; then
   echo "Check parameters on switchBetweenSoftLinks.properties file. All parameters [FILETRANSPORT_INPUT_DIR,FILETRANSPORT_INPUT_DIR_SKATONLY,ALIAS,SCRIPT_PATH] must be defined and not empty."
   exit
fi

if [ "$1" == "allow-all" ]; then
   if [ -d "$FILETRANSPORT_INPUT_DIR" ]; then
     echo "Points the softlink to $FILETRANSPORT_INPUT_DIR"
#     cd /${MOUNT}/app/oracle/domains/${MOUNT}wls/Files
     cd $SCRIPT_PATH
     ln -sfnv $FILETRANSPORT_INPUT_DIR $ALIAS
     cd -
     StatusOut "Change softlink $ALIAS to $FILETRANSPORT_INPUT_DIR"
   else
     echo "$FILETRANSPORT_INPUT_DIR is not a directory"
     exit
   fi
else
   if [ -d "$FILETRANSPORT_INPUT_DIR_SKATONLY" ]; then
     echo "Points the softlink to $FILETRANSPORT_INPUT_DIR_SKATONLY"
#     cd /${MOUNT}/app/oracle/domains/${MOUNT}wls/Files
     cd $SCRIPT_PATH
     ln -sfnv $FILETRANSPORT_INPUT_DIR_SKATONLY $ALIAS
     cd -
     StatusOut "Change softlink $ALIAS to $FILETRANSPORT_INPUT_DIR_SKATONLY"
   else
     echo "$FILETRANSPORT_INPUT_DIR_SKATONLY is not a directory"
     exit
   fi
fi

if [ ! -e $SCRIPT_PATH ]; then
     StatusOut "softlink $ALIAS Does not exist!"
else
     StatusOut "softlink $ALIAS OK"
fi

