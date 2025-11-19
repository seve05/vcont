#!/bin/bash
cd
echo "Please put in the IP-address NFS-Server"
read IP
echo "Please put in the mount point like this  mnt/networkshare  to continue installing"
read Mnt
read -p "Inputs correct? (Y/N): " confirm && [[ $confirm == [yYj] || $confirm == [yYjJ][eEaA][sS] ]] || exit 1
#exit1 if error such that user can get the ip right
echo $Mnt > mntpoint.txt
echo $IP > nfsipaddr.txt
echo "You can update the IP adress of the server in case you want to change it in ~bin/nfsipaddr.txt"

#if future me ever gets asked this question: no indents because EOF syntax "here document" wont allow for it.
if ! [[ -f "$HOME/updog" ]]; then
cat > updog << 'EOF'
#!/bin/bash
IPadrpath="/bin/nfsipaddr.txt"
Mountpath="/bin/mntpoint.txt"
IPadr=$(cat "$IPadrpath")
Mountpnt=$(cat "$Mountpath")
sudo mount -t nfs "$IPadr":"$Mountpnt" "$HOME/networkfolder"
dest="$HOME/networkfolder"
cp -f "$1" "$dest"
EOF
else
echo "updog already exists, exiting"
exit 1
fi

if ! [[ -f "$HOME/networkfolder" ]]; then
	mkdir -p "$HOME/networkfolder"
else
	echo "cant create networkfolder, already exists, if intentional: please ignore"
fi

sudo chmod +x updog
sudo mv updog ~bin/
sudo mv mntpoint.txt ~bin/
sudo mv nfsipaddr.txt ~bin/

#now we need to install NFS Client if not present, configure NFS IP on client
sudo apt install nfs-common
#sudo mount -t nfs "$IP":mnt/networkshare "$HOME/networkfolder"

