#!/bin/bash

########################
# include the magic
########################
. ../demo-magic.sh

# hide the evidence
clear


pe "podman-machine ssh WSC 'ps aux | grep crio'"
pe "podman-machine ssh WSC 'cat /etc/crictl.yaml'"
pe "podman-machine ssh WSC 'kubectl version'"
pe "podman-machine ssh WSC 'kubectl run httpd --generator=run-pod/v1 --image=httpd'"

# Will wait max 5 seconds until user presses
PROMPT_TIMEOUT=5
wait
pe "podman-machine ssh WSC 'kubectl get po'"
pe "podman-machine ssh WSC 'kubectl get pods -o wide --show-all'"
pe "export POD_HOST=$(podman-machine ssh WSC 'kubectl get pod httpd --template={{.status.podIP}}')"
pe "podman-machine ssh WSC 'curl http://$POD_HOST'"
pe "podman-machine ssh WSC 'sudo crictl images'"
pe "podman-machine ssh WSC 'sudo crictl ps'"
pe "podman-machine ssh WSC 'sudo crictl pods'"
pe "podman-machine ssh WSC 'sudo crictl pull alpine'"
pe "podman-machine ssh WSC 'sudo crictl images'"
pe "podman-machine ssh WSC 'kubectl delete po,deployment --all'"
