# start podman-machine

```
$ podman-machine ssh PCD-CRIO-19
```

# Get details about podman

```
$ podman info
```

# Registries list: /etc/containers/registries.conf

# start httpd container and testing it
```
$ sudo podman run -dt --ip=10.88.64.128 -p 8080:8080/tcp -e HTTPD_VAR_RUN=/var/run/httpd -e HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d \
                  -e HTTPD_MAIN_CONF_PATH=/etc/httpd/conf \
                  -e HTTPD_CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/httpd/ \
                  registry.fedoraproject.org/f27/httpd /usr/bin/run-httpd

$ sudo podman image ls -a
$ sudo podman ps
$ curl http://10.88.64.128:8080
```
# Cleaning
```
$ sudo podman rm -f --all && sudo podman rmi -f --all
```
# Podman and pods
```
$ podman pod --help
```
## Create a Pod
```
$ podman pod create
$ podman pod ps
$ export NAME_POD=$(podman pod ps --format json | jq -r .[0].name)
$ podman ps --pod 
```

## Add a Container to an existing POD
```
$ podman run -dt --pod $NAME_POD docker.io/library/alpine:latest top
$ podman ps -a --pod
```
# RUN A NEW POD nginx
```
$ sudo podman run -dt --pod new:nginx -p 32597:80 quay.io/libpod/alpine_nginx:latest
$ sudo podman pod ps
$ sudo podman ps -a --pod
$ sudo podman ps
$ podman ps
$ curl http://localhost:32597

```

## PODMAN TO KUBE (NOT YET IMPLEMENTED WITH ROOTLESS)
```
$ sudo podman generate kube nginx  > nginx.yml
$ sudo podman generate kube --service nginx > nginx_service.yml
$ less nginx_service.yml
```

## Clean up

```
$ sudo podman pod stop --all
$ sudo podman pod rm -f --all
$ sudo podman play kube nginx.yml
$ sudo podman pod ps
$ sudo podman pod rm -f --all
$ sudo podman rm --all
$ kubectl create -f nginx_service.yml
$ kubectl get svc
```
## This is will not work, why ?
```
$ kubectl logs nginx
```

# Podman rootless
## Create a file in my system owned by root.
```
$ sudo bash -c "echo WespeakCloud > /tmp/test"
$ sudo chmod 600 /tmp/test 
$ sudo ls -l /tmp/test
```

## volume-mount the file into a container running with a user namespace map 0:100000:5000.
```
$ sudo podman run -ti -v /tmp/test:/tmp/test --uidmap 0:100000:5000 fedora sh
# id
# ls -l /tmp/test
# cat /tmp/test
```

## Process created by podman
```
$ sudo podman run --uidmap 0:100000:5000 -d fedora sleep 1000
$ ps -ef | grep sleep
```

# clean all 
```
$ podman pod rm -f --all && sudo podman pod rm -f --all
$ podman rm -f --all && sudo podman rm -f --all
$ podman rmi -f --all & sudo podman rmi -f --all
$ kubectl delete svc,pod nginx
```
