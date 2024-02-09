#!/bin/sh

option="---"
while [ "$option" != "" ] && [ "$option" != "0" ]
do

    clear
    echo "$ADM_DIVIDER"
    echo "$ADM_LOGO"
    echo "$ADM_DIVIDER"
    echo "### STORAGE ###"
    echo "$ADM_DIVIDER"
    
    if [ "$option" == "---" ]; then

        echo " 0 = [BACK]"
        echo " 1 = Commands"
        echo " 2 = Storage Usage (GB)"
        echo " 3 = Directories Size Tree (KB)"
        echo " 4 = FileSystem Size Tree (KB)"
        echo "$ADM_DIVIDER"

        echo -n "Enter option: "
        read -r -s -n 1 option

    else

        if [ "$option" == "1" ]; then
            echo "- df"
            echo "- df -B GB"
            echo "- du /"
            echo "- du -k -c /"
            echo "- du -k -c -a /"
        fi

        if [ "$option" == "2" ]; then
            df -B GB
        fi

        if [ "$option" == "3" ]; then
            du -k -c /
        fi

        if [ "$option" == "4" ]; then
            du -k -c -a /
        fi

        echo "$ADM_DIVIDER"
        echo -n "Enter to continue..."
        read -r -s -n 1 option
        option="---"

    fi

done
