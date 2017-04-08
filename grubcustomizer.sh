cd ~
mkdir -p Git
cd Git
apt-get install build-essential cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev 
wget https://goo.gl/qQnUhK -O grub-customizer_4.0.6.tar.gz 
tar xfv grub-customizer_4.0.6
cd grub-customizer_4.0.6
cmake . && make -j3 
make install