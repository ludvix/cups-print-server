#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install cups

sudo apt install printer-driver-brlaser # installs drivers for brother printers

sudo usermod -aG lpadmin $USER

sudo sed -i "s/Listen localhost:631/Listen $(hostname).local:631/" /etc/cups/cupsd.conf