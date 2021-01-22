#!/bin/bash
#
# Adding Rules Service configuration for the Import Authorization validation service(SKAT-1847)
#
# Created:    20170327
# Author:     silvacj, siigerm
# Version:    XYZ (By svn/maven/nexus)

# *************************************************************************
# Variables
# *************************************************************************

PROTOCOL="http"
HOST=$1
PORT=$2
PING_ECHO="/rules/rest/ping"
VALIDATE_ECHO="/rules/rest/validateDeclaration"
USER_AGENT_ECHO="Mozilla/5.0"
PING="\/rules\/services\/rest\/ping"
VALIDATE="\/rules\/services\/rest\/validateDeclaration"
USER_AGENT="Mozilla\/5.0"
DOMAIN="/$MOUNT/app/oracle/domains/${MOUNT}wls/"
#DOMAIN="./"
CONFIG_FILE="${DOMAIN}importConf.properties"
TODAY="$(date '+%Y%d%m-%H%M%S')"

# Terminal text effects
GREEN="${RUN_BY_ANSIBLE:-$(tput setaf 2)}"
GREEN="${GREEN/$RUN_BY_ANSIBLE/}"
BOLD="${RUN_BY_ANSIBLE:-$(tput bold)}"
BOLD="${BOLD/$RUN_BY_ANSIBLE/}"
RED="${RUN_BY_ANSIBLE:-$(tput setaf 1)}"
RED="${RED/$RUN_BY_ANSIBLE/}"
RESET="${RUN_BY_ANSIBLE:-$(tput sgr0)}"
RESET="${RESET/$RUN_BY_ANSIBLE/}"

# *************************************************************************
# Functions
# *************************************************************************
# Usage info
function usage () {
    echo "Adding Rules Service configuration - usage:"
    echo
    echo "$0 <import server host> <import server port>"
    echo
    exit 0
#    return
}

function error () {
    echo
    echo "${RED}$1${RESET}"
    echo
}

function print_start () {
    text=$1
    start_time=$2
    echo
    echo "################################################################################"
    echo "${GREEN}${text}${RESET}${BOLD} - $(date --date=@$start_time "+%Y.%d.%m %H:%M:%S") $RESET"
    echo "################################################################################"
}

function print_end () {
    text=$1
    start_time=$2
    end_time=$(date +%s)
    secs=$(($end_time - $start_time))
    elapsed=$(printf 'Elapsed Time %dh:%dm:%ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60)))
    echo
    echo "################################################################################"
    echo "${GREEN}${text}${RESET}${BOLD} - $(date "+%Y.%d.%m %H:%M:%S") $elapsed $RESET"
    echo "################################################################################"
    echo
}

# *************************************************************************
# Main
# *************************************************************************
# Check that we have mandatory arguments to the command
if [ $# -lt 2 ]; then
    usage
fi

# Check CONFIG_FILE exists
if [ ! -f $CONFIG_FILE ] ; then
    error "$0 - Error: $CONFIG_FILE file not found"
    exit 1
#    return
fi

start_time=$(date +%s)
print_start "Start - add new properties in $CONFIG_FILE" $start_time
echo

echo "Create a backup of importConf.properties in old/"
mkdir -p ${DOMAIN}old
cp -p $CONFIG_FILE ${DOMAIN}old/importConf.properties.$TODAY
echo

echo
echo "Updating Rules Service configuration:"
echo "Check if RULES_SERVICE_PROTOCOL exists"
if grep -q "RULES_SERVICE_PROTOCOL=" $CONFIG_FILE
then
    echo "RULES_SERVICE_PROTOCOL exists"
    echo "Check the values before replacing:"
    grep "RULES_SERVICE_PROTOCOL=" $CONFIG_FILE
    echo
    sed -i "s/RULES_SERVICE_PROTOCOL=.*/RULES_SERVICE_PROTOCOL=$PROTOCOL/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "RULES_SERVICE_PROTOCOL=" $CONFIG_FILE
    echo
else
    echo "RULES_SERVICE_PROTOCOL does not exists"
    echo "#SKAT-1847 RULES SERVICE" >> $CONFIG_FILE
    echo 'RULES_SERVICE_PROTOCOL='$PROTOCOL >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "RULES_SERVICE_PROTOCOL=" $CONFIG_FILE
    echo
fi
echo
echo "Check if RULES_SERVICE_HOST exists"
if grep -q "RULES_SERVICE_HOST=" $CONFIG_FILE
then
    echo "RULES_SERVICE_HOST exists"
    echo "Check the values before replacing:"
    grep "RULES_SERVICE_HOST=" $CONFIG_FILE
    echo
    sed -i "s/RULES_SERVICE_HOST=.*/RULES_SERVICE_HOST=$HOST/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "RULES_SERVICE_HOST=" $CONFIG_FILE
    echo
else
    echo "RULES_SERVICE_HOST does not exists"
    echo 'RULES_SERVICE_HOST='$HOST >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "RULES_SERVICE_HOST=" $CONFIG_FILE
    echo
fi
echo
echo "Check if RULES_SERVICE_PORT exists"
if grep -q "RULES_SERVICE_PORT=" $CONFIG_FILE
then
    echo "RULES_SERVICE_PORT exists"
    echo "Check the values before replacing:"
    grep "RULES_SERVICE_PORT=" $CONFIG_FILE
    echo
    sed -i "s/RULES_SERVICE_PORT=.*/RULES_SERVICE_PORT=$PORT/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "RULES_SERVICE_PORT=" $CONFIG_FILE
    echo
else
    echo "RULES_SERVICE_PORT does not exists"
    echo 'RULES_SERVICE_PORT='$PORT >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "RULES_SERVICE_PORT=" $CONFIG_FILE
    echo
fi
echo
echo "Check if RULES_SERVICE_PING exists"
if grep -q "RULES_SERVICE_PING=" $CONFIG_FILE
then
    echo "RULES_SERVICE_PING exists"
    echo "Check the values before replacing:"
    grep "RULES_SERVICE_PING=" $CONFIG_FILE
    echo
    sed -i "s/RULES_SERVICE_PING=.*/RULES_SERVICE_PING=$PING/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "RULES_SERVICE_PING=" $CONFIG_FILE
    echo
else
    echo "RULES_SERVICE_PING does not exists"
    echo 'RULES_SERVICE_PING='$PING_ECHO >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "RULES_SERVICE_PING=" $CONFIG_FILE
    echo
fi
echo
echo "Check if RULES_SERVICE_VALIDATE exists"
if grep -q "RULES_SERVICE_VALIDATE=" $CONFIG_FILE
then
    echo "RULES_SERVICE_VALIDATE exists"
    echo "Check the values before replacing:"
    grep "RULES_SERVICE_VALIDATE=" $CONFIG_FILE
    echo
    sed -i "s/RULES_SERVICE_VALIDATE=.*/RULES_SERVICE_VALIDATE=$VALIDATE/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "RULES_SERVICE_VALIDATE=" $CONFIG_FILE
    echo
else
    echo "RULES_SERVICE_VALIDATE does not exists"
    echo 'RULES_SERVICE_VALIDATE='$VALIDATE_ECHO >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "RULES_SERVICE_VALIDATE=" $CONFIG_FILE
    echo
fi
echo
echo "Check if RULES_SERVICE_USER_AGENT exists"
if grep -q "RULES_SERVICE_USER_AGENT=" $CONFIG_FILE
then
    echo "RULES_SERVICE_USER_AGENT exists"
    echo "Check the values before replacing:"
    grep "RULES_SERVICE_USER_AGENT=" $CONFIG_FILE
    echo
    sed -i "s/RULES_SERVICE_USER_AGENT=.*/RULES_SERVICE_USER_AGENT=$USER_AGENT/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "RULES_SERVICE_USER_AGENT=" $CONFIG_FILE
    echo
else
    echo "RULES_SERVICE_USER_AGENT does not exists"
    echo 'RULES_SERVICE_USER_AGENT='$USER_AGENT_ECHO >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "RULES_SERVICE_USER_AGENT=" $CONFIG_FILE
    echo
fi

print_end "End" $start_time

