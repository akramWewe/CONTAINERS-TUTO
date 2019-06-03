# démarrer la vm podman-machine
```
$ podman-machine ssh PCD-CRIO-19
```

# know version podman
$ podman version

# Get details about podman
$ podman info

    >>> montrer la partie regitries
    >>> montrer la partie ConfigFile / spécifier le cloisonnement user

# Know about registries list: /etc/containers/registries.conf

# Lancer un conteneur de test
$ podman run -dt -p 8080:8080/tcp -e HTTPD_VAR_RUN=/var/run/httpd -e HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d \
                  -e HTTPD_MAIN_CONF_PATH=/etc/httpd/conf \
                  -e HTTPD_CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/httpd/ \
                  registry.fedoraproject.org/f27/httpd /usr/bin/run-httpd

$ podman image ls -a
$ podman ps -a
$ podman inspect -l | grep IPAddress\"

# Testing httpd Server
$ curl http://<IP_address>:8080

$ podman rmi --all
$ podman rm --all

# Podman rootless
$ cat /etc/subuid
dwalsh:100000:65536
test:165536:65536
$ cat /etc/subgid
dwalsh:100000:65536
test:165536:65536

podman run alpine cat /proc/self/uid_map /proc/self/gid_map

# buildah unshare
ls -ld /home/tc/
buildah unshare ls -ld /home/tc/


# Montrer les id process
podman run alpine -d sleep 1000
podman top --latest pid hpid

