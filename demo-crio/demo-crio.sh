#!/bin/bash

########################
# include the magic
########################
. ../demo-magic.sh

# hide the evidence
clear

# Put your stuff here

pe "ps aux | grep crio"
pe "cat /etc/crictl.yaml"
pe "kubectl version"
pe "kubectl run httpd --generator=run-pod/v1 --image=httpd"
pe "kubectl get po"
pe "kubectl get pods -o wide --show-all"

