#!/bin/bash

########################
# include the magic
########################
. ../demo-magic.sh



# hide the evidence
clear

# modify read_only = true, pids_limit = 50 in /etc/crio/crio.conf
pe "export CRIO_PID=$(podman-machine ssh WSC 'pidof crio')"
pe "podman-machine ssh WSC 'pidof crio' | podman-machine ssh WSC 'sudo xargs kill'"
pe "podman-machine ssh WSC 'sudo -b crio'"
