######
  iniciar cluster 
  sudo kubeadm init --apiserver-advertise-address 192.168.50.10 --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint 192.168.50.10:6443

######
configurar kubeconfig

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

  kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

######
  criando token no cluster

  kubeadm token create --print-join-command
  ######
  unindo node ao cluster

  kubeadm join 192.168.50.10:6443 --token by0aq1.imnmhenf8x8ollze --discovery-token-ca-cert-hash sha256:d0acb4f4c4a30b36bfb2c168b04f3578cb3a9eb25b42b1c2e5984ed6c87222d5