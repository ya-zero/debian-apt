# Debian Buster Post Install Desktop

## Reference Download ISO Debian Buster

- Debian HTTP download AMD64: [DVD](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-10.2.0-amd64-DVD-1.iso)
- Debian HTTP download i386: [DVD](https://cdimage.debian.org/debian-cd/current/i386/iso-dvd/debian-10.2.0-i386-DVD-1.iso)

## Recommendations

### Disks partitions for Personal Desktop

- swap: 2 GB
- / (root): 60 GB
- /home (User directory): Free space remaining

### Repositorys for Personal Desktop

For **/etc/apt/sources.list**: 

```sh 
## Official Repository
deb http://ftp.br.debian.org/debian buster main contrib non-free
deb http://ftp.br.debian.org/debian buster-updates main contrib non-free
deb http://ftp.br.debian.org/debian buster-backports main contrib non-free
deb http://security.debian.org/debian-security buster/updates main contrib non-free

## Multimedia Repository non-free
deb http://www.deb-multimedia.org buster main non-free
``` 

### Optionals repositorys

For **/etc/apt/sources.list.d/mariadb.list**

```sh
## MariaDB Official
deb [arch=amd64] https://mirrors.nxthost.com/mariadb/repo/10.4/debian buster main
deb-src [arch=amd64] https://mirrors.nxthost.com/mariadb/repo/10.4/debian buster main
```

For **/etc/apt/sources.list.d/docker-ce.list**

```sh
## Docker CE Official
deb [arch=amd64] https://download.docker.com/linux/debian buster stable
deb-src [arch=amd64] https://download.docker.com/linux/debian buster stable
```

For **/etc/apt/sources.list.d/virtualbox.list**

```sh
## Virtualbox Official
deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian buster contrib
```

## List Packages

### Debian packages

```sh 
## Essentials packages for OS
linux-headers-$(uname -r) build-essential checkinstall make automake cmake autoconf aptitude lsb-release 

## Packages for manage versions
git subversion subversion-tools

## Packages requiered for hardware Intel
intel-microcode intel-gpu-tools inteltool lm-sensors

## Packages Firmware
firmware-linux firmware-linux-free firmware-linux-nonfree 

## Packages for compress and uncompress
bzip2 zip unzip unace rar unace-nonfree p7zip p7zip-full p7zip-rar unrar unrar-free lzip lhasa arj sharutils mpack lzma lzop cabextract xz-utils

## Extra tools
whois telnet vim traceroute nmap bind9utils dnsutils curl wget tree net-tools acpi acpitool locales htop ethtool mlocate pv rsync

## Tools for laptop 
laptop-mode-tools tuned tuned-gtk tuned-utils hardinfo arc-theme gnome-tweak-tool gnome-tweaks acpi acpid
```

### SSH Server (Optional)

```sh
## Remote connection SSH and mosh
ssh openssh-server openssh-client mosh
```

### Firewall (Optional)

```sh
## Option 1
uif			
```
or
```sh
## Option 2
ufw gufw			
```

### Vitualization

```sh
## KVM Virtualization
qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virt-viewer virt-what virtinst
```
or 
```sh
## Virtualbox Virtualization
virtualbox-6.0
```

### Web Server

```sh
## Apache Web
apache2 apache2-utils
```
or
```sh
## Nginx Web
nginx nginx-extras
```

### PHP

```sh
## First install
libapache2-mod-php php-common php-pear mcrypt php-gd php-cli php-curl php-mysql php-zip
## Second install
libapache2-mod-php7.3 php7.3-common php7.3 php7.3-cli php7.3-curl php7.3-mysql php7.3-odbc php7.3-pgsql php7.3-sqlite3 php7.3-json php7.3-readline php7.3-gd
```

### Certificates SSL

```sh
## Certbot project
letsencrypt
```

### Packages for multimedia

```sh
## Codecs, Sound and Video
vlc ffmpeg gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio vorbis-tools faac faad
```

### Fonts Typographics

```sh
## Fonts for OS
ttf-mscorefonts-installer fonts-freefont-ttf fonts-freefont-otf
```

### Graphics Design 

```sh 
## Editor images
gimp gimp-data-extras inkscape inkscape-open-symbols sozi dia dia-rib-network dia-shapes dia-common
```

### Web Browsers 

```sh 
## Default Firefox ESR and Chromium
firefox-esr chromium-l10n
```

### Docker CE - MariaDB

```sh
    ## Docker CE
    docker-ce docker-ce-cli containerd.io
    ## mariaDB
    mariadb-server mariadb-client mycli
```