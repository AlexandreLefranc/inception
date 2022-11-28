# inception

## Setup VM

Used of Alpine Linux VM edition

- 8 Go should be enough
- 2 Go RAM
- 4 CPU ?
- 64Mo Graphic memory
- 3D acceleration

```bash
setup-alpine
reboot

setup-desktop and create user alefranc
apk update
apk add sudo

visudo : uncomment '%wheel ALL=(ALL:ALL) ALL'
adduser alefranc wheel

apk add docker docker-cli-compose git
rc-update add docker
service docker start
adduser alefranc docker

apk add virtualbox-guest-additions
apk add virtualbox-guest-additions-x11
rc-update add virtualbox-drm-client default

reboot
login as alefranc
```

