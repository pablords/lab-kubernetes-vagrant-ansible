#####
Para verificar info de hosts

ansible -i hosts master -m setup --inventory-file ${inventory}

ansible-playbook -i hosts playbook.yml --check

#####

Caso nao consiga listar inventario, executar o seguinte comando

export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -i




######

correcao erro kubeadm init {COMENTAR disabled_plugins}


#disabled_plugins = ["cri"]

#root = "/var/lib/containerd"
#state = "/run/containerd"
#subreaper = true
#oom_score = 0

#[grpc]
#  address = "/run/containerd/containerd.sock"
#  uid = 0
#  gid = 0

#[debug]
#  address = "/run/containerd/debug.sock"
#  uid = 0
#  gid = 0
#  level = "info"
