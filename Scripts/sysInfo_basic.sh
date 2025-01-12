#!/bin/bash

display_message() {
    local message=$1
    local border="==============================================================================="
    echo -e "\n$border$message$border\n"
}

function system_info() {
    local msg="
|                                                                             
|           System Information :                                               
|    ---------------------------------                                        
|    Hostname: $(hostname)                                                    
|    Uptime: $(uptime -p)                                                     
|    Operating System: $(uname -o)                                            
|    Kernel Version: $(uname -r)                                              
|    CPU Architecture: $(uname -m)                                            
|    Total RAM: $(free -h | grep Mem | awk '{print $2}')                      
|    Available RAM: $(free -h | grep Mem | awk '{print $7}')                  
|    Total Disk Space: $(df -h --total | grep total | awk '{print $2}')       
|    Available Disk Space: $(df -h --total | grep total | awk '{print $4}')
|
|           Network Information :
|    ----------------------------------
|    Wifi SSID: $(iwgetid -r)
|    Wifi Signal Strength: $(iwgetid -r | xargs -I {} iwconfig {} | grep Signal | awk '{print $4}' | cut -d= -f2) 
|    Network Name: $(hostname -f)
|    Domain Name: $(hostname -d) 
|    Gateway: $(ip route | grep default | awk '{print $3}') 
|    IPv4 Address: $(ip addr | grep inet | grep -v inet6 | awk '{print $2}' | paste -sd, -)
|    IPv6 Address: $(ip addr | grep inet6 | grep -v ::1 | awk '{print $2}' | paste -sd, -)
|    Ethernet MAC Address: $(ip link | grep ether | awk '{print $2}' | head -n 1)
|    Wifi MAC Address: $(ip link | grep ether | awk '{print $2}' | tail -n 1)
|    DNS Servers: $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}' | paste -sd, -)clear
|    Open Ports: $(ss -tuln | grep LISTEN | awk '{print $4}' | cut -d: -f2 | sort -u | paste -sd, -)
|     
"
    display_message "$msg"
}

system_info
