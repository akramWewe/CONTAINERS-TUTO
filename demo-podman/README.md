# start podman-machine

```
$ podman-machine ssh PCD-CRIO-19
```

# know version podman

```
$ podman version
```

# Get details about podman

```
$ podman info
```

# Registries list: /etc/containers/registries.conf

# start httpd container
```
$ sudo podman run -dt --ip=10.88.64.128 -p 8080:8080/tcp -e HTTPD_VAR_RUN=/var/run/httpd -e HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d \
                  -e HTTPD_MAIN_CONF_PATH=/etc/httpd/conf \
                  -e HTTPD_CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/httpd/ \
                  registry.fedoraproject.org/f27/httpd /usr/bin/run-httpd

$ sudo podman image ls -a
$ sudo podman ps
$ podman ps
$ export IPADRESS=$(sudo podman inspect --format '{{ .NetworkSettings.IPAddress }}' -l)
```

# Testing httpd Server
$ echo $IPADRESS
$ curl http://$IPADRESS:8080

# Cleaning 
$ sudo podman rm -f --all

# Podman and pods

$ podman pod --help

## Create a Pod
$ podman pod create
$ podman pod ps
$ export NAME_POD=[NAME OF POD]
$ podman ps --pod 


## Add a Container to an existing POD
$ podman run -dt --pod $NAME_POD docker.io/library/alpine:latest top
$ podman ps -a --pod

# RUN A NEW POD nginx
$ podman run -dt --pod new:nginx -p 32597:80 quay.io/libpod/alpine_nginx:latest
$ podman pod ps
$ podman ps -a --pod
$ curl http://localhost:32597

# DELETE POD
$ podman pod stop --all
$ podman pod rm -f --all

## PODMAN TO KUBE (NOT YET IMPLEMENTED WITH ROOTLESS)

$ sudo podman run -dt --pod new:nginx -p 32597:80 quay.io/libpod/alpine_nginx:latest
$ sudo podman pod ps
$ sudo podman generate kube nginx  > nginx.yml
$ sudo podman generate kube --service nginx > nginx_service.yml
$ less nginx_service.yml
$ sudo podman pod stop --all
$ sudo podman pod rm -f --all
$ sudo podman play kube nginx.yml
$ sudo podman pod ps
$ kubectl create -f nginx_service.yml
$ kubectl get svc

## This is will not work, why ?
$ kubectl logs nginx


# Podman rootless
```
$ cat /etc/passwd
$ cat /etc/subuid
$ cat /etc/subgid
$ podman run alpine cat /proc/self/uid_map /proc/self/gid_map
```

# Run a command in a modified user namespace
```
$ ls -ld /home/tc/
$ buildah unshare ls -ld /home/tc/
```

# Montrer les id process
```
podman run -d alpine sleep 1000
podman top --latest pid hpid
```

# clean all 
```
$ podman pod rm -f --all
$ podman rmi -f --all
$ podman rm --all
```
