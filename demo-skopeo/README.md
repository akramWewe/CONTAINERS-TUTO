
# Inspect image and copy image to a directory
```
$ skopeo inspect docker://docker.io/fedora
$ sudo su
$ mkdir -p /var/lib/images/busybox
$ sudo skopeo copy docker://busybox:latest dir:/var/lib/images/busybox
```
