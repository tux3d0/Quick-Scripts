#!/bin/bash

function system_info() {
    echo "Operating System: $(uname -o)"
    echo "Kernel Version: $(uname -r)"
    echo "Total RAM: $(free -h | grep Mem | awk '{print $2}')"
    echo "Available RAM: $(free -h | grep Mem | awk '{print $7}')"
    echo "Total Disk Space: $(df -h --total | grep total | awk '{print $2}')"
    echo "Available Disk Space: $(df -h --total | grep total | awk '{print $4}')"
}

system_info