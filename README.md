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
automake cmake autoconf aptitude lsb-release

## Packages for manage versions
apt install -y git subversion subversion-tools

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
apt install -y laptop-mode-tools tuned tuned-gtk tuned-utils hardinfo arc-theme \
gnome-tweak-tool gnome-tweaks acpi acpid acpitool
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
## Default Firefox ESR and Chromium
apt install -y chromium chromium-l10n
```

### Additional packages

```sh
apt install -y ghex gitg gqrx-sdr htop peek stegosuite vokoscreen
```