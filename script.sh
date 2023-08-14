#!/bin/bash

## LoginViaRoot v2 (SSH + System Login)
## Developed by: https://github.com/medowic

## Repository: https://github.com/medowic/setup-root-login

tput reset

RED='\033[31m'
ORANGE='\033[33m'
GREEN='\033[92m'
NC='\033[0m'

## Is Root?

if [ "${EUID}" -ne 0 ]; then

    echo -e -n "${RED}You need to run this script as root.${NC}";
    echo " Are you root?";
    echo "";
    exit 1;

fi

## Initialization startHere

function startHere() {

    tput reset

    echo "Welcome to LoginViaRoot Setup!"
    echo "Actual repository: https://github.com/medowic/setup-root-login"
    echo ""
    echo ""

}

## Initialization passwdRoot

function passwdRoot() {

    echo -n "Have you set a password for root? "

    while true; do

        read -p "[Yes/No]> " passwdRooting

        if [ "${passwdRooting,,}" == "yes" ] || [ "${passwdRooting,,}" == "y" ]; then

            tput reset;
            startHere;
            break;

        elif [ "${passwdRooting,,}" == "no" ] || [ "${passwdRooting,,}" == "n" ]; then

            echo "Enter a new password for root";
            passwd root;

            tput reset;
            startHere;
            break;

        else

            continue;

        fi

    done

}

## Initialization goStart

function goStart() {

    echo -e "${ORANGE}Starting setup...${NC}"
    echo ""

    passwd -u root >/dev/null 2>&1
    echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config >/dev/null 2>&1
    systemctl restart sshd >/dev/null 2>&1

    echo "# DON'T TOUCH THIS FILE!
    # IT SHOWS THE SCRIPT (LoginViaRoot) THAT IT HAS BEEN INSTALLED
    # DELETE IT ONLY IF AN ERROR OCCURRED DURING THE INSTALLATION PHASE
    # 
    # OR DELETE THIS FILE FOR A HARD REINSTALL WITHOUT LEGAL REMOVE
    #
    #
    # Repository: https://github.com/medowic/setup-root-login" > /opt/.LoginViaRoot

    tput reset

    echo -e "Install: ${GREEN}Done!${NC} Optional, reboot your machine."
    echo ""
    echo "---------------------------------------------"
    echo ""

}

## Initialization mainMenu

function mainMenu() {

    echo -e "${ORANGE}It's looks like you already have a LoginViaRoot.${NC}"
    echo ""
    echo "Hello, user! What do you want now?"
    echo ""
    echo ""
    echo "1) Change password for root"
    echo "0) Exit"
    echo ""

    while true; do

        read -p "LoginViaRoot:~# " doing

        if [ "${doing}" == "1" ]; then

            startHere;

            echo "";
            echo "Enter new password for root:";
            passwd root;

            passwd -u root >/dev/null 2>&1;

            tput reset;

            startHere;

            echo "";
            echo -e "Change password: ${GREEN}Success${NC}";
            echo "";
            echo "";

            mainMenu;

        elif [ "${doing}" == "0" ]; then

            echo "";
            echo "Exit...";
        
            exit 0;

        elif [ -z "${doing}" ]; then

            continue;

        else

            echo "";
            echo -e "-- LoginViaRoot: ${doing}: command ${RED}not found${NC}";
            echo "";

            continue;

        fi

    done

}

## Already have?

if [ -f "/opt/.LoginViaRoot" ]; then
   
    startHere;
    mainMenu;

else
   
    startHere;
    passwdRoot;
    goStart;
    mainMenu;

fi
