# Debian Buster Post Install Desktop

## Repositories for Personal Desktop

For **/etc/apt/sources.list**: 

```sh 
## Official Repository
deb http://ftp.br.debian.org/debian buster main contrib non-free
deb http://ftp.br.debian.org/debian buster-updates main contrib non-free
deb http://ftp.br.debian.org/debian buster-backports main contrib non-free
deb http://security.debian.org/debian-security buster/updates main contribnon-free

## Multimedia Repository non-free
deb http://www.deb-multimedia.org buster main non-free
``` 

## Package List

### Debian Base

```sh 
## Essentials packages for OS
apt install -y linux-headers-$(uname -r) build-essential checkinstall make \
automake cmake autoconf aptitude lsb-release dkms

## Packages for manage versions
apt install -y git gitg

## Packages requiered for hardware Intel
apt install -y intel-microcode intel-gpu-tools inteltool lm-sensors

## For lm-sensors
sensor-detect --auto

## Packages Firmware
apt install -y firmware-linux firmware-linux-free firmware-linux-nonfree 

## Packages for compress and uncompress
apt install -y bzip2 zip unzip unace rar unace-nonfree p7zip p7zip-full \
p7zip-rar unrar unrar-free lzip lhasa arj sharutils mpack lzma lzop \
cabextract xz-utils

## Extra tools
apt install -y whois telnet vim traceroute nmap bind9utils dnsutils curl \
wget tree net-tools locales htop ethtool mlocate pv rsync

## Tools for laptop 
apt install -y laptop-mode-tools 

## Required Packages
apt install -y apt-transport-https ca-certificates curl gnupg-agent \
software-properties-common tuned tuned-gtk tuned-utils hardinfo \
arc-theme gnome-tweak-tool gnome-tweaks acpi acpid acpitool \
software-properties-common dirmngr
```

### SSH Server (Optional)

```sh
## Remote connection SSH and mosh
apt install -y ssh openssh-server openssh-client mosh
```

### Firewall (Optional)

```sh
## Option 1
apt install -y uif			
```

or

```sh
## Option 2
apt install -y ufw gufw			
```

### Vitualization

```sh
## KVM Virtualization
apt install -y qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system \
virt-viewer virt-what virtinst virt-manager

## For privileges < >
adduser $(whoami) libvirt
adduser $(whoami) libvirt-qemu
adduser $(whoami) kvm
```

### Web Server

```sh
## Apache Web
apt install -y apache2 apache2-utils
```

or

```sh
## Nginx Web
nginx nginx-extras
```

### PHP

```sh
## First install
apt install -y php php-common php-pear mcrypt php-gd php-cli \
php-curl php-mysql php-zip libapache2-mod-php php-odbc php-pgsql \
php-sqlite3 php-json php-readline php-gd  
```

### Certificates SSL

```sh
## Certbot project
apt install -y letsencrypt
```

### Packages for multimedia

```sh
## Codecs, Sound and Video
apt install -y vlc gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad \
gstreamer1.0-pulseaudio vorbis-tools faac faad w64codecs ffmpeg ffmpeg2theora libdvdcss2 \
libdvdread4
```

### Fonts Typographics

```sh
## Fonts for OS
apt install -y ttf-mscorefonts-installer fonts-freefont-ttf fonts-freefont-otf
```

### Graphics Design 

```sh 
## Editor images
apt install -y gimp gimp-data-extras inkscape inkscape-open-symbols sozi dia \
dia-rib-network dia-shapes dia-common
```

### Web Browsers 

```sh 
## Chromium
apt install -y chromium chromium-l10n
```

### Additional Packages

```sh
apt install -y ghex gqrx-sdr peek vokoscreen stegosuite etherape ettercap-text-only \
fritzing fritzing-parts mediainfo mediainfo-gui linkchecker testssl.sh speedtest-cli \
arduino arduino-core wireshark zim 
```

## MariaDB DataBase

```sh
## /etc/apt/sources.list.d/mariadb.list
deb [arch=amd64] http://ftp.icm.edu.pl/pub/unix/database/mariadb/repo/10.4/debian buster main
deb-src http://ftp.icm.edu.pl/pub/unix/database/mariadb/repo/10.4/debian buster main

## Adding Key
apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'

## Install Packages
apt install mariadb-server mariadb-client mycli
```

## VirtualBox

```sh 
## /etc/apt/sources.list.d/virtualbox.list
deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian buster contrib

## Adding Key
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

## Install Package
apt-get install virtualbox-6.1

## Oracle VM VirtualBox Extension Pack
Download for curren version: https://virtualbox.org
```

## Docker CE

```sh 
## /etc/apt/sources.list.d/docker-ce.list
deb [arch=amd64] https://download.docker.com/linux/debian buster stable

##  Adding Key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

## Install Packages
apt-get install docker-ce docker-ce-cli containerd.io

## Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

## Execution Privileges
sudo chmod +x /usr/local/bin/docker-compose

## Create Symbolic Links
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```