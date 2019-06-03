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
$ podman run -dt -p 8080:8080/tcp -e HTTPD_VAR_RUN=/var/run/httpd -e HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d \
                  -e HTTPD_MAIN_CONF_PATH=/etc/httpd/conf \
                  -e HTTPD_CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/httpd/ \
                  registry.fedoraproject.org/f27/httpd /usr/bin/run-httpd

$ podman image ls -a
$ podman ps -a
$ podman inspect -l | grep IPAddress\"
```

# Testing httpd Server
$ curl http://<IP_address>:8080

# Podman and pods

$ podman run -dt --pod new:nginx -p 32597:80 quay.io/libpod/alpine_nginx:latest
$ podman ps -a --pod
$ curl http://localhost:32597

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
