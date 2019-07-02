# start podman-machine
```
podman-machine create --virtualbox-boot2podman-url https://github.com/boot2podman/boot2podman/releases/download/v0.21/boot2podman-kubernetes.iso WSC
```
# podman-machine launch
```
podman-machine ssh WSC
```
# install k3s, crio
```
tce-load -i crio k3s
tce-load -iw curl
tce-load -iw git
tce-load -iw bash

```
# start process crio
```
sudo -b crio
```
# find missed images
```
find /usr/local/share/k3s/ -type f | xargs -n 1 sudo podman load -i
```
# start k3s
```
sudo -b k3s server --container-runtime-endpoint /var/run/crio/crio.sock --no-deploy traefik --no-deploy servicelb
```