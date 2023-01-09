# inception

## Setup VM

Used of Fedora Xfce

- 12 Go should be enough
- 2 Go RAM
- 4 CPU ?
- 64Mo Graphic memory
- 3D acceleration

```bash
sudo dnf update

reboot

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl enable docker
sudo gpasswd -a ${USER} docker

sudo gpasswd -a ${USER} vboxsf

sudo dnf install git htop

shutdown 0
```

Take a Snapshot

## Nginx

- https://www.youtube.com/watch?v=SqE5uUbBU78

## MariaDB

- https://wiki.alpinelinux.org/wiki/MariaDB
- https://github.com/bianjp/docker-mariadb-alpine
- https://github.com/yobasystems/alpine-mariadb