#!/bin/sh

option="---"
while [ "$option" != "" ] && [ "$option" != "0" ]
do

    clear
    echo "$ADM_DIVIDER"
    echo "$ADM_LOGO"
    echo "$ADM_DIVIDER"
    echo "### USERS AND GROUPS ###"
    echo "$ADM_DIVIDER"
    
    if [ "$option" == "---" ]; then

        echo " 0 = [BACK]"
        echo " 1 = Commands"
        echo " 2 = Users"
        echo " 3 = Groups"
        echo " 4 = Users  - Detailed"
        echo " 5 = Groups - Detailed"
        echo "$ADM_DIVIDER"

        echo -n "Enter option: "
        read -r -s -n 1 option

    else

        if [ "$option" == "1" ]; then
            echo "- useradd"
            echo "- usermod"
            echo "- userdel"
            echo ""
            echo "- groupadd"
            echo "- groupmod"
            echo "- groupdel"
        fi

        if [ "$option" == "2" ]; then
            list=$( cat /etc/passwd | cut -d\: -f1 )
            echo "$list"
        fi

        if [ "$option" == "3" ]; then
            list=$( cat /etc/group | cut -d\: -f1 )
            echo "$list"
        fi

        if [ "$option" == "4" ]; then
            list=$( cat /etc/passwd )
            echo "$list"
        fi

        if [ "$option" == "5" ]; then
            list=$( cat /etc/group )
            echo "$list"
        fi

        echo "$ADM_DIVIDER"
        echo -n "Enter to continue..."
        read -r -s -n 1 option
        option="---"

    fi

done
