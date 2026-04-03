### When switching between machines I want no friction
### This script also sets up the nfs client and adds automount in /etc/fstab

Requires: 
A running NFS Server; the user to know the target dir + ip 

### Installation w install script:
sudo chmod +x installupdog.sh

./installupdog.sh

### Once installed:
you can do:

updog Myfile.filnameextension 

or

updog Mydirectory


This performs some checks and replaces the old file in the target dir with the current one 

###
sudo ./installupdog.sh -r 

To reconfigure the target IP, server mountpoint

## to add macos machine in /etc/exports add "insecure" to the attributeslist bc mac wants to use port 1024 
