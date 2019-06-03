
# Inspecter image
$ skopeo
$ skopeo inspect docker://docker.io/fedora
$ sudo su
$ mkdir -p /var/lib/images/busybox
$ skopeo copy docker://busybox:latest dir:/var/lib/images/busybox
