#!/bin/bash

MY_PATH="`dirname \"$0\"`"
cd $MY_PATH

if [ -z "${MOUNT}" ]; then
   echo "MOUNT is null or is not defined"
   exit
fi

# source the properties
. ./moveFiles.properties


#Properties file validation
if [ -z "$INPUT_DIR" ] || [ -z "$OUTPUT_DIR" ] || [ -z "$FLAG" ]; then
   echo "Check parameters on moveFiles.properties file. All parameters [INPUT_DIR,OUTPUT_DIR,FLAG] must be defined and not empty."
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


file_count=0
echo "$file_count" > work.fl

StatusOut "Moving from: $INPUT_DIR"
StatusOut "Moving to:   $OUTPUT_DIR"

grep -l -r $FLAG $INPUT_DIR | while read in_file
do
  ((file_count++))
  echo "$file_count" > work.fl
  StatusOut "  Moving $in_file"
  mv "$in_file" "$OUTPUT_DIR"
done
echo
file_count=$(<work.fl)
StatusOut "Moved $file_count files"
rm -f work.fl

cat moveFiles.sh.log
