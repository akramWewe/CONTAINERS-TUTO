
# Inspect image and copy image to a directory
```
$ skopeo
$ skopeo inspect docker://docker.io/fedora
$ sudo su
$ mkdir -p /var/lib/images/busybox
$ skopeo copy docker://busybox:latest dir:/mnt/sda1/local/share/containers/storage/overlay-images
```
