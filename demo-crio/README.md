## start minikube with crio as a container runtime
#minikube start --container-runtime=cri-o

#minikube ssh -- sudo journalctl -u crio
# sudo systemctl daemon-reload
# sudo systemctl restart crio

## See if crio process is active
#minikube ssh -- systemctl status crio | grep active
$ ps aux | grep crio
$ cat /etc/crictl.yaml

## demo-crio ##
kubectl version
kubectl run httpd --generator=run-pod/v1 --image=httpd
kubectl get po
kubectl get pods -o wide --show-all
curl http://10.88.0.4

# get images with crictl
$ sudo crictl images
$ sudo crictl ps
$ sudo crictl pods
$ sudo crictl pull alpine
$ sudo crictl images


# kubectl delete all --all
## Test crio security

# Change conf file  sudo vi /etc/crio/crio.conf
$ sudo vi /etc/crio/crio.conf

# add read_only = true
# modify pids_limit = 50
$ ps -a | grep crio

$ kill -9 [process crio ]
$ sudo -b crio

#sudo systemctl daemon-reload
#sudo systemctl restart crio

# test if we can add a file
kubectl run -i --tty --rm busybox --image=busybox --restart=Never -- sh

# create a file in /var
touch /var/test 
=> error

# try to start more than 50 process
cat /sys/fs/cgroup/pids/pids.max

while [ true ]
do
    echo "sleeping ... "
    sleep 20 &
done