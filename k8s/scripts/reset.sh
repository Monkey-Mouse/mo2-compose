kubeadm reset
systemctl stop kubelet
systemctl stop docker
rm -rf /var/lib/cni/
rm -rf /var/lib/kubelet/*
rm -rf /etc/cni/
ifconfig cni0 down
ifconfig flannel.1 down
ifconfig docker0 down
ip link del flannel.1
ip link set cni0 down
brctl delbr cni0
iptables --flush
iptables -tnat --flush
systemctl start kubelet
systemctl start docker
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X