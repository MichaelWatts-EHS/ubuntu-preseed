#!/bin/bash

# Pulse VPN
echo 'Installing Pulse Secure VPN Client'
apt -y install '/_post/ps-pulse-ubuntu-debian.deb'
/opt/pulsesecure/bin/jamCommand /importfile /_post/EOTSS_Azure.pulsepreconfig
/opt/pulsesecure/bin/setup_cef.sh install
rm /_post/ps-pulse-ubuntu-debian.deb
rm /_post/EOTSS_Azure.pulsepreconfig

# Prep the Horizon client settings
mkdir /etc/vmware/
echo 'view.allowautoConnectBroker=FALSE' > /etc/vmware/view-mandatory-config
echo 'view.allowdefaultBroker=FALSE' >> /etc/vmware/view-mandatory-config   
echo 'view.autoConnectBroker="vdi.ehs.govt.state.ma.us"' > /etc/vmware/view-default-config
echo 'view.defaultBroker="vdi.ehs.govt.state.ma.us"' >> /etc/vmware/view-default-config
echo 'view.defaultDesktop="Standard Desktop"' >> /etc/vmware/view-default-config
echo 'view.autoConnectDesktop=TRUE' >> /etc/vmware/view-default-config
echo 'view.fullScreen=TRUE' >> /etc/vmware/view-default-config
echo 'view.nomenubar=TRUE' >> /etc/vmware/view-default-config
echo 'view.once=TRUE' >> /etc/vmware/view-default-config   

# VMware Horizon View
echo 'Installing VMware Horizon View Client'
/_post/VMware-Horizon-Client-2303-8.9.0-21435420.x64.bundle --console --required --stop-services

# Alternate install
#env TERM=dumb \
#/_post/VMware-Horizon-Client-2303-8.9.0-21435420.x64.bundle --console \
#--set-setting vmware-horizon-usb usbEnable no \
#--set-setting vmware-horizon-smartcard smartcardEnable no \      
#--set-setting vmware-horizon-rtav rtavEnable yes \
#--set-setting vmware-horizon-tsdr tsdrEnable yes \
#--set-setting vmware-horizon-scannerclient scannerEnable yes \
#--set-setting vmware-horizon-serialportclient serialportEnable yes \
#--set-setting vmware-horizon-mmr mmrEnable yes \
#--set-setting vmware-horizon-media-provider mediaproviderEnable yes

# Cleanup?
# the remove fails for some reason (in use?)
rm /_post/

