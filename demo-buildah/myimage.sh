#!/bin/bash

# Create a container
container=$(buildah from centos)

# Labels are part of the "buildah config" command
buildah config --label maintainer="Akram BLOUZA <akram.blouza@wescale.fr>" $container


# Install httpd inside the CentOs Container
buildah run $container yum install httpd -y

# Let’s create custom index.html file.
echo "Welcome to WeSpeakCloud !" > index.html

# Grab the source code outside of the container
buildah copy $container index.html /var/www/html/index.html


# Comfigure entrypoint for the container
buildah config --entrypoint "/usr/sbin/httpd -DFOREGROUND" $container 

# Save the new version 
buildah commit $container WeSpeakCloud-HelloWorld