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

# exit container
```
$ exit
```