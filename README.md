######
comandos básicos
######
link tutorial rede dns
https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-36598b5e8408

######
iniciar cluster com ip publico
sudo kubeadm init --apiserver-advertise-address 10.0.0.10 --pod-network-cidr=10.1.0.0/16 --control-plane-endpoint 10.0.0.10:6443

######
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

  kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

######
Isolamento de nó de plano de controle 
Por padrão, seu cluster não agendará pods no nó do plano de controle por motivos de segurança. Se você quiser agendar pods no nó do plano de controle, por exemplo, para um cluster Kubernetes de máquina única para desenvolvimento, execute:

kubectl taint nodes --all node-role.kubernetes.io/master-