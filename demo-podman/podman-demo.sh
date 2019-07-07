#!/bin/bash

########################
# include the magic
########################
. ../demo-magic.sh

# hide the evidence
clear

pe "podman-machine ssh WSC 'podman version'"
pe "podman-machine ssh WSC 'podman info'"
pe "podman-machine ssh WSC 'sudo podman run -dt -p 8080:8080/tcp -e HTTPD_VAR_RUN=/var/run/httpd -e HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d -e HTTPD_MAIN_CONF_PATH=/etc/httpd/conf -e HTTPD_CONTAINER_SCRIPTS_PATH=/usr/share/container-scripts/httpd/ registry.fedoraproject.org/f27/httpd /usr/bin/run-httpd'"

PROMPT_TIMEOUT=5
wait

pe "podman-machine ssh WSC 'sudo podman image ls -a'"
pe "podman-machine ssh WSC 'sudo podman ps'"
pe "podman-machine ssh WSC 'podman ps'"
pe "export IPADRESS=$(podman-machine ssh WSC "sudo podman inspect --format '{{ .NetworkSettings.IPAddress }}' -l")"
pe "podman-machine ssh WSC 'sudo podman inspect -l | grep IPAddress'"
pe "podman-machine ssh WSC 'sudo podman rm -f --all'"