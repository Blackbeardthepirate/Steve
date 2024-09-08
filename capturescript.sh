#! /bin/bash

#This script is designed to passivly monitor and capture network traffic upon boot and end when power is disconnected.

#Boot-up delay
sleep 30

#Disable NetworkMonitor (passive)
sudo airmon-ng check kill

#Enable Wireless Adapter (set to start either wlan0 or wlan1 depending on how your card displays)
sudo airmon-ng start wlan0
sudo airmon-ng start wlan1


#Capture command to scan bot 2.4GHz and 5GHz chanels, capture SSID info and export to a file that can be analyzed in Wireshark

sudo airodump-ng --band ab wlan0mon -w capturefile.pcap
sudo airodump-ng --band ab wlan1mon -w capturefile.pcap

# Note you'll need to schedule a cronjob to run this script upon reboot
# here are the cronjob commands
# crontab -e (opens the cron scheduler) 
# scroll to thebottom and add the command--> @reboot timeout 1h /full/file/path/to/script.sh



