#!/bin/sh

option="---"
while [ "$option" != "" ] && [ "$option" != "0" ]
do

    clear
    echo "$ADM_DIVIDER"
    echo "$ADM_LOGO"
    echo "$ADM_DIVIDER"
    echo "### MEMORY ###"
    echo "$ADM_DIVIDER"
    
    if [ "$option" == "---" ]; then

        echo " 0 = [BACK]"
        echo " 1 = Commands"
        echo " 2 = Memory Stats"
        echo " 3 = Memory Stats - Detailed"
        echo "$ADM_DIVIDER"

        echo -n "Enter option: "
        read -r -s -n 1 option

    else

        if [ "$option" == "1" ]; then
            echo "- cat /proc/meminfo"
            echo "- cat /proc/meminfo | grep 'MemTotal:\|MemFree:\|MemAvailable:'"
        fi

        if [ "$option" == "2" ]; then
            list=$( cat /proc/meminfo | grep 'MemTotal:\|MemFree:\|MemAvailable:' )
            echo "$list"
        fi

        if [ "$option" == "3" ]; then
            list=$( cat /proc/meminfo )
            echo "$list"
        fi

        echo "$ADM_DIVIDER"
        echo -n "Enter to continue..."
        read -r -s -n 1 option
        option="---"

    fi

done
