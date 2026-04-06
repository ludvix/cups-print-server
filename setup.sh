#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install cups

sudo apt install printer-driver-brlaser # installs drivers for brother printers

sudo usermod -aG lpadmin $USER
