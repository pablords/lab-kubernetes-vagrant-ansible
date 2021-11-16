    
    echo "iniciando cluster"
    sudo kubeadm init --apiserver-advertise-address 10.0.0.10 --pod-network-cidr=10.1.0.0/16 --control-plane-endpoint 10.0.0.10:6443
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
    kubectl taint nodes --all node-role.kubernetes.io/master-
    sudo systemctl daemon-reload
    sudo systemctl restart docker