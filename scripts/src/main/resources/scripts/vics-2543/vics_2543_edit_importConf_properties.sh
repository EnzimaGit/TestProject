#!/bin/bash
#
# Add OSB servlet endpoint for EU VAT validation and set property moms validation number as true
#
# Created:    20170206
# Author:     silvacj
# Version:    XYZ (By svn/maven/nexus)

# *************************************************************************
# Variables
# *************************************************************************

SERVLET_URL="http:\/\/$1\/servlet\/checkVAT\/"
SERVLET_URL_ECHO="http://$1/servlet/checkVAT/"
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
    echo "Add OSB servlet endpoint for EU VAT validation and set property moms validation number as true - usage:"
    echo
    echo "$0 <OSB managed server host:port>"
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
if [ $# -lt 1 ]; then
    usage
fi

# Check CONFIG_FILE exists
if [ ! -f $CONFIG_FILE ] ; then
    error "$0 - Error: $CONFIG_FILE file not found"
    exit 1
#    return
fi

start_time=$(date +%s)
print_start "Adding OSB servlet endpoint and setting moms validation number as true in $CONFIG_FILE" $start_time
echo

echo "Create a backup of importConf.properties in old/"
mkdir -p ${DOMAIN}old
cp -p $CONFIG_FILE ${DOMAIN}old/importConf.properties.$TODAY
echo

echo "Check the values before replacing:"
grep "MOMS_NUMBER_VALIDATION=" $CONFIG_FILE
echo
echo "Replacing MOMS_NUMBER_VALIDATION"
sed -i "s/MOMS_NUMBER_VALIDATION=.*/MOMS_NUMBER_VALIDATION=true/" $CONFIG_FILE
echo
echo "Check the values after replacing:"
grep "MOMS_NUMBER_VALIDATION=" $CONFIG_FILE
echo
echo "Check if MOMSNUMMER_VALIDATION_SERVLET exists"
if grep -q "MOMSNUMMER_VALIDATION_SERVLET=" $CONFIG_FILE
then
    echo "MOMSNUMMER_VALIDATION_SERVLET exists"
    echo "Check the values before replacing:"
    grep "MOMSNUMMER_VALIDATION_SERVLET=" $CONFIG_FILE
    echo
    sed -i "s/MOMSNUMMER_VALIDATION_SERVLET=.*/MOMSNUMMER_VALIDATION_SERVLET=$SERVLET_URL/" $CONFIG_FILE
    echo "Check the values after replacing:"
    grep "MOMSNUMMER_VALIDATION_SERVLET=" $CONFIG_FILE
    echo
else
    echo "MOMSNUMMER_VALIDATION_SERVLET does not exists"
    echo "#VICS-2543" >> $CONFIG_FILE
    echo 'MOMSNUMMER_VALIDATION_SERVLET='$SERVLET_URL_ECHO >> $CONFIG_FILE
    echo "Check the values after adding:"
    grep "MOMSNUMMER_VALIDATION_SERVLET=" $CONFIG_FILE
    echo
fi

print_end "End" $start_time

