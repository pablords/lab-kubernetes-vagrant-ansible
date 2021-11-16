
BASE_BOX_URL = "ubuntu/bionic64"
BASE_IP_MASTER = "10.0.0.10"

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  config.vm.define "master", primary: true do |master|
    master.vm.box = BASE_BOX_URL
    master.vm.network "public_network", ip: BASE_IP_MASTER
    master.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    master.vm.provision :shell, :inline => "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys", run: "always"
    master.vm.synced_folder "./apps", "/home/vagrant/apps"
    master.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end

  config.trigger.after :up do |trigger|
    trigger.name = "Iniciar cluster Kubernetes"
    trigger.info = "Cluster iniciado com sucesso!!"
    config.vm.provision "shell", path: "kubernetes/cluster-init.sh"
  end


end