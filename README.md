# start podman-machine
```
podman-machine create --virtualbox-boot2podman-url https://github.com/boot2podman/boot2podman/releases/download/v0.21/boot2podman-kubernetes.iso PCD-CRIO-19
```
# podman-machine launch
```
podman-machine ssh PCD-CRIO-19
```
# install k3s, crio
```
tce-load -i crio k3s
tce-load -iw curl
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