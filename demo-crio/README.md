
# See if crio process is active
```
$ ps aux | grep crio
$ cat /etc/crictl.yaml
```
## demo-crio
```
$ kubectl version
$ kubectl run httpd --generator=run-pod/v1 --image=httpd
$ kubectl get po
$ kubectl get pods -o wide --show-all
curl http://<ip>
```
# get images with crictl
```
$ sudo crictl images
$ sudo crictl ps
$ sudo crictl pods
$ sudo crictl pull alpine
$ sudo crictl images
```

# delete all
```
kubectl delete po,deployment --all 
```
## Test crio security

# Change conf file  sudo vi /etc/crio/crio.conf
```
// modify read_only = true, pids_limit = 50
$ sudo vi /etc/crio/crio.conf 
```

# restart crio process 
```
$ ps -a | grep crio
$ sudo kill -9 [process crio ]
$ sudo -b crio
```

# test if we can add a file
```
kubectl run -i --tty --rm busybox --image=busybox --restart=Never -- sh
```

# create a file in /var
```
touch /var/test 
```
# try to start more than 50 process
```
cat /sys/fs/cgroup/pids/pids.max

while [ true ]
do
    echo "sleeping ... "
    sleep 20 &
done
```

# clean all
```
$ kubectl delete po,deployment --all
```