#!/bin/bash

echo "Options for Install"
DATA="l"

while [ $DATA != "*" ]; do 
    case $DATA in
        l)
            echo "List options: "
            echo "[1] Add Repository Debian"
            echo "[2] Add Repository Docker - MariaDB - Virtualbox"
            echo "[3] Install Debian Packages"
            echo "[4] Install SSH Server"
            echo "[5] Install KVM Server"
            echo "[6] Install Virtualbox"
            echo "[7] Install Firewall UIF"
            echo "[8] Install Firewall ufw"
            echo "[9] Install Apache"
            echo "[10] Install Nginx"
            echo "[11] Install PHP"
            echo "[12] Install Packages Multimedia"
            echo "[13] Install Fonts Typographics"
            echo "[14] Install Packages Graphics Design"
            echo "[15] Install Web Browser"
            echo "[16] Install Docker CE"
            echo "[17] Install MariaDB"
            echo "[Exit] Terminated"
            echo "Enter option:"
            read DATA
        ;;
        1)
            echo "Add Repository Debian"
            cp -rf apt/sources.list /etc/apt/sources.list
            echo "Add Keyring deb-multimedia"
            wget -P /var/cache/apt/archives/ http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
            dpkg -i /var/cache/apt/archives/deb-multimedia-keyring_2016.8.1_all.deb
            apt update
            apt upgrade -y 
            systemctl reboot
            DATA=l
        ;;
        2)
            echo "Add Repository Docker - MariaDB - Virtualbox"
            cp -rf apt/sources.list.d/docker-ce.list /etc/apt/sources.list.d/
            cp -rf apt/sources.list.d/mariadb.list /etc/apt/sources.list.d/
            cp -rf apt/sources.list.d/virtualbox.list /etc/apt/sources.list.d/
            apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common dirmngr
            echo "Docker GPG Key"
            curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
            echo "Mariadb GPG Key"
            apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
            echo "Virtualbox GPG Key"
            wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
            wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
            apt update
            apt upgrade -y

            DATA=l
        ;;
        3)
            echo "Install Debian Packages"
            apt install -y linux-headers-$(uname -r) build-essential checkinstall make automake cmake autoconf aptitude lsb-release 

            echo "Install Packages for manage versions"
            apt install -y git subversion subversion-tools

            echo "Install Packages requiered for hardware Intel"
            apt install -y intel-microcode intel-gpu-tools inteltool lm-sensors

            echo "Install Packages Firmware"
            apt install -y firmware-linux firmware-linux-free firmware-linux-nonfree 

            echo "Install Packages for compress and uncompress"
            apt install -y bzip2 zip unzip unace rar unace-nonfree p7zip p7zip-full p7zip-rar unrar unrar-free lzip lhasa arj sharutils mpack lzma lzop cabextract xz-utils

            echo "Install Extra tools"
            apt install -y whois telnet vim traceroute nmap bind9utils dnsutils curl wget tree net-tools acpi acpitool locales htop ethtool mlocate pv rsync

            echo "Install Tools for laptop "
            apt install -y laptop-mode-tools tuned tuned-gtk tuned-utils hardinfo arc-theme gnome-tweak-tool gnome-tweaks acpi acpid

            echo "Autoconf sensors"
            sensor-detect --auto

            DATA=l
        ;;
        4)
            echo "Install SSH Server"
            apt install -y ssh openssh-server openssh-client mosh
            DATA=l
        ;;
        5)
            echo "Install KVM Server"
            apt install -y virt-manager qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virt-viewer virt-what virtinst
            adduser $(whoami) libvirt
            adduser $(whoami) libvirt-qemu
            adduser $(whoami) kvm
            DATA=l
        ;;
        6)
            echo "Install Virtualbox"
            apt install -y dkms virtualbox-6.0
            adduser $(whoami) vboxusers
            DATA=l
        ;;
        7)
            echo "Install Firewall UIF"
            apt install -y uif
            DATA=l
        ;;
        8)
            echo "Install Firewall ufw"
            apt install ufw gufw
            DATA=l
        ;;
        9)
            echo "Install Apache"
            apt install apache2 apache2-utils
            DATA=l
        ;;
        10)
            echo "Install Nginx"
            apt install nginx nginx-extras
            DATA=1
        ;;
        11)
            echo "Install PHP"
            apt install -y libapache2-mod-php php-common php-pear mcrypt php-gd php-cli php-curl php-mysql php-zip
            apt install -y libapache2-mod-php7.3 php7.3-common php7.3 php7.3-cli php7.3-curl php7.3-mysql php7.3-odbc php7.3-pgsql php7.3-sqlite3 php7.3-json php7.3-readline php7.3-gd
            DATA=1
        ;;
        12)
            echo "Install Packages Multimedia"
            apt install -y vlc ffmpeg gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio vorbis-tools faac faad
            DATA=1
        ;;
        13)
            echo "Install Fonts Typographics"
            apt install -y ttf-mscorefonts-installer fonts-freefont-ttf fonts-freefont-otf
            DATA=1
        ;;
        14)
            echo "Install Packages Graphics Design"
            apt install -y gimp gimp-data-extras inkscape inkscape-open-symbols sozi dia dia-rib-network dia-shapes dia-common
            DATA=1
        ;;
        15)
            echo "Install Web Browser"
            apt install -y firefox-esr chromium chromium-l10n
            DATA=1
        ;;
        16)
            echo "Install Docker CE"
            apt install -y docker-ce docker-ce-cli containerd.io
            adduser $(whoami) docker
            DATA=1
        ;;
        17)
            echo "Install MariaDB"
            apt install -y mariadb-server mariadb-client mycli
            DATA=1
        ;;
        *)
            echo "Congratulations!!!"
            break
        ;;
    esac
done