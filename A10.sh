#!/bin/bash
# ------NOT FINISHED------#
echo "A10.sh Script"
read -p "Press [Enter] key to continue..." fackEnterKey

echo "---------------------------------------------"
echo "Select an option to begin the install and configuration..."
echo "-----------------------------------------------------------"
sleep 2

# function to display the menu.
show_menu() {
        clear
        echo "Select an option to begin the install and configuration..."
        echo "-----------------------------------------------------------"
        echo "1. Logfile setup and configuration to verbose"
        echo "2. Intrusion Detection Systems and Anti-Virus setup and configuration"
        echo "3. Logswatch setup and configuration"
}
# function to display menu options.
read_options(){
        local choice
        read -p "Select Option [ 1 - 3] " choice
        case $choice in
                1) A10P1 ;;
                2) A10P2 ;;
                3) A10P3 ;;
                *) echo -e "${RED}Error...${STD}" && sleep 2
        esac

# A10P1 is a function that runs when ity is called
# from the read_options function
A10P1() {

        clear
        echo "1. System Log File set to verbose"
        echo "2. SSHd.service Log file set to verbose"
        echo "3. Something not sure yet."
        sleep 1

# This is a function within the A10P1 function that allows for
# a second menu too chose what log file you can view in a verbose mode.
log_option() {
        local choice
        read -p "Select Option [ 1 - 3] " choice
        case $choice in
                1) tail -f /var/log/auth.log ;;
                2)  ;;
                3)  ;;
                *) echo -e "${RED}Error...${STD}" && sleep 2
        esac



        }

log_option

}


A10P2() {

echo "Second Option"
sleep 6

}


A10P3() {

echo "Running Installation"
sudo apt install logwatch
echo "Install Complete"
sleep 1
clear

echo "Opening logwatch.conf"
echo "Here you can config logwatch"
sleep 2.5

# nano edits the logwatch.conf file.
sudo nano /usr/share/logwatch/default.conf/logwatch.conf
sleep 0.5
clear

echo "Enter in the command and file name for output"
echo "For example: --detail low"

# Creates a variable that allows for users text input.
read logwatch
sudo logwatch $logwatch
sleep 1

clear
echo "Now chose another option:.."
sleep 0.5
read -p "Press [Enter] key to continue..." fackEnterKey

 }
}

# runs the functions within the while.
# When its true it runs the following shown below.
while true
do
        show_menu
        read_options
done
