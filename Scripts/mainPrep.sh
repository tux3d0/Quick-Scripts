#!/bin/bash
#===============================================================================
#
#          FILE: mainPrep.sh
# 
#         USAGE: ./mainPrep.sh
# 
#   DESCRIPTION: Script description here
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Your Name
#  ORGANIZATION: Your Organization
#       CREATED: $(date +%Y-%m-%d)
#      REVISION: ---
#===============================================================================
#set -o nounset                              # Treat unset variables as an error    
#set -e # Exit on error 
#set -x # Debugging on
#set -u # Exit if variable is unset
#set -o pipefail # Exit if pipe fails
#set -o errexit # Exit on error
#set -o errtrace # Exit on error
#set -o functrace # Exit on error
#set -o xtrace # Exit on error
#set -o verbose # Exit on error
#set -o noclobber # Exit on error
#set -o noglob # Exit on error
#set -o nounset # Exit on error
#set -o notify # Exit on error
#set -o ignoreeof # Exit on error
#set -o monitor # Exit on error
#set -o nocaseglob # Exit on error
#set -o nolog # Exit on error
#set -o vi # Exit on error
#set -o emacs # Exit on error
#set -o nocaseglob # Exit on error
#set -o nullglob # Exit on error
#set -o ignoreeof # Exit on error
#set -o noexec # Exit on error
#set -o noglob # Exit on error
#set -o nolog # Exit on error
#set -o pipefail # Exit on error
#set -o verbose # Exit on error
#set -o xtrace # Exit on error
#set -o ignoreeof # Exit on error
#set -o notify # Exit on error

# Global Variables

# Functions
updateSys() {
    echo 'Bringing the system up-to-date before moving forward......'
    sudo apt-get update -y
    sudo apt-get full-upgrade -y
  #  sudo apt-get dist-upgrade -y # Uncomment if using out-dated .iso
    sudo apt-get autoremove -y
    sudo apt-get autoclean -y
}
installTools(){
    echo -e 'Installing Tools from your APT tools.list... \n'
	xargs sudo apt install -y < reqs.list
}
createDirs() {
    echo 'Creating directories...'
    mkdir $HOME/Machines        # VMs
    mkdir $HOME/Projects        # Projects
    mkdir $HOME/Scripts         # Scripts
    mkdir $HOME/VPN            # VPN Configs
    mkdir $HOME/ISOs           # ISOs for VMs & USBs
}

# Main
main() {
    echo "Your machine is now being prepped..."
    updateSys
    installTools
    createDirs
    echo "Your machine is now prepped..."
}
# End
main
```

###



###
