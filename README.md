### Version control for my local nfs network to update files when switching machines 
### This script also sets up the nfs client and automounts it in /etc/fstab
Requires: 
A running NFS Server; the user to know the target DIR + IP 

### Installation w install script:
sudo chmod +x installupdog.sh

./installupdog.sh

### Once installed:
updog myfile.filenameextension
This simply replaces the old file in the target dir with the current one

###
sudo .installupdog.sh -r 
To reconfigure the target IP, mountpoint
