# Detect version of buildah
buildah version

# Creation d'un container à partir d'une image
$ container=$(buildah from fedora)
$ echo $container
$ buildah images
$ buildah run $container -- dnf -y install java
$ buildah run $container java --version
$ buildah run $container bash


>>>>>> ICI DIRE qu'il ya moyen de builder from scratch, faire des install de ce qu'on a besoin et pusher le résultat sans passer par un DockerFile
# build a container from scratch
$ newcontainer=$(buildah from scratch)
$ buildah containers
$ buildah images
$ buildah unshare
$ scratchmnt=$(buildah mount $newcontainer)
