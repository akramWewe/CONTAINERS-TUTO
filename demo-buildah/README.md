# Detect version of buildah
```
buildah version
```
# Creation d'un container à partir d'une image
```
$ container=$(buildah from fedora)
$ echo $container
$ buildah images
$ buildah run $container -- dnf -y install java
$ buildah run $container java --version
$ buildah run $container bash
```
# build a container from scratch without DockerFile
```
$ newcontainer=$(buildah from scratch)
$ buildah containers
```
# delete all
$ buildah rm --all
$ buildah rmi --all

