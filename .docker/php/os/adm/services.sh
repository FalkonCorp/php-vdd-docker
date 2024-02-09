#!/bin/sh

option="---"
while [ "$option" != "" ] && [ "$option" != "0" ]
do

    clear
    echo "$ADM_DIVIDER"
    echo "$ADM_LOGO"
    echo "$ADM_DIVIDER"
    echo "### SERVICES ###"
    echo "$ADM_DIVIDER"
    
    if [ "$option" == "---" ]; then

        echo " 0 = [BACK]"
        echo " 1 = Commands"
        echo " 2 = Services Files"
        echo " 3 = RunLevels List"
        echo " 4 = Services Running"
        echo " 5 = Services Full List"
        echo " 6 = [REALTIME] Services Running"
        echo "$ADM_DIVIDER"

        echo -n "Enter option: "
        read -r -s -n 1 option

    else

        if [ "$option" == "1" ]; then
            echo "- ls --color=auto -lAs /etc/init.d/"
            echo "- rc-status -l"
            echo "- rc-status -a"
            echo "- rc-status -s"
        fi

        if [ "$option" == "2" ]; then
            list=$( ls --color=auto -lAs /etc/init.d/ )
            echo "$list"
        fi

        if [ "$option" == "3" ]; then
            rc-status -l
        fi

        if [ "$option" == "4" ]; then
            rc-status -a
        fi

        if [ "$option" == "5" ]; then
            rc-status -s
        fi

        if [ "$option" == "6" ]; then
            option=""
            while [ "$option" == "" ]
            do 
                clear
                rc-status -a
                read -r -s -n 1 -t 0.25 option
            done
            option="DONTWAIT"
        fi

        
        if [ "$option" != "DONTWAIT" ]; then
            echo "$ADM_DIVIDER"
            echo -n "Enter to continue..."
            read -r -s -n 1 option
        fi
        option="---"

    fi

done
