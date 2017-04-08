 
#! /bin/bash
apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

#! Installs applications
apt-get install dirmngr -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install alsa-utils unrar unace rar unrar p7zip zip unzip p7zip-full p7zip-rar file-roller software-properties-common apt-file gnome-themes-standard tor torbrowser-launcher filezilla filezilla-common gtk-recordmydesktop recordmydesktop remmina gdebi uget x2goclient numlockx smplayer spotify-client -y

#! add debian repository
apt-file update
apt-file search add-apt-repository
cd /usr/sbin

#! Add debian repository
echo Adding Debian repository...
echo '#!/bin/bash' > test.txt
echo 'if [ $# -eq 1 ]' >> test.txt
echo 'NM=`uname -a && date`' >> test.txt
echo 'NAME=`echo $NM | md5sum | cut -f1 -d" "`' >> test.txt
echo 'then' >> test.txt
echo  'ppa_name=`echo "$1" | cut -d":" -f2 -s`' >> test.txt
echo  'if [ -z "$ppa_name" ]' >> test.txt
echo  'then' >> test.txt
echo    'echo "PPA name not found"' >> test.txt
echo    'echo "Utility to add PPA repositories in your debian machine"' >> test.txt
echo    'echo "$0 ppa:user/ppa-name"' >> test.txt
echo  'else' >> test.txt
echo    'echo "$ppa_name"' >> test.txt
echo    'echo "deb http://ppa.launchpad.net/$ppa_name/ubuntu oneiric main " >> /etc/apt/sources.list' >> test.txt
echo    'apt-get update >> /dev/null 2> /tmp/${NAME}_apt_add_key.txt' >> test.txt
echo    'key=`cat /tmp/${NAME}_apt_add_key.txt | cut -d":" -f6 | cut -d" " -f3`' >> test.txt
echo    'apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key' >> test.txt
echo    'rm -rf /tmp/${NAME}_apt_add_key.txt' >> test.txt
echo  'fi' >> test.txt
echo 'else' >> test.txt
echo  'echo "Utility to add PPA repositories in your debian machine"' >> test.txt
echo  'echo "$0 ppa:user/ppa-name"' >> test.txt
echo  'fi' >> test.txt
cp test.txt /usr/sbin/add-apt-repository
rm test.txt
chmod o+x /usr/sbin/add-apt-repository
chown root:root /usr/sbin/add-apt-repository

#!update keys
cp /etc/apt/sources.list /etc/apt/sources.list.bk
/usr/sbin/add-apt-repository ppa:noobslab/themes
rm /etc/apt/sources.list
mv /etc/apt/sources.list.bk /etc/apt/sources.list

#!arc kde
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/arc-kde/master/install-arc-kde-root.sh | sh
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-smplayer-theme/master/install-papirus-root.sh | sh
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-filezilla-themes/master/install-papirus-root.sh | sh

#!grubtheme
chmod +x ./grubtheme.sh
./grubtheme.sh

#!grub-customizer
chmod +x ./grubcustomizer.sh
./grubcustomizer.sh
