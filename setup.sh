#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install cups

sudo apt install printer-driver-brlaser # installs drivers for brother printers

sudo usermod -aG lpadmin $USER

# Cups allow access from the local network
sudo sed -i "s/Listen localhost:631/Listen $(hostname).local:631/" /etc/cups/cupsd.conf
sudo sed -i "/<Location \/>/a\ Allow @local" /etc/cups/cupsd.conf
sudo sed -i "/<Location \/admin>/a\ Allow @local" /etc/cups/cupsd.conf
sudo sed -i "/<Location \/admin\/conf>/a\ Allow @local" /etc/cups/cupsd.conf
sudo systemctl restart cups

# Fix cups on reboot
echo -e "#!/bin/sh\nsudo systemctl restart cups.service" | sudo tee /etc/network/if-up.d/cups
sudo chmod +x /etc/network/if-up.d/cups

# Install samba and config to make fully cross platform
sudo apt install samba
echo -e "[printers]
comment = All Printers
browseable = yes
path = /var/spool/samba
printable = yes
guest ok = no
read only = yes
create mask = 0700" | sudo tee -a /etc/samba/smb.conf

sudo systemctl restart smbd