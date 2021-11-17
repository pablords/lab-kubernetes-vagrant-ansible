
BASE_BOX_URL = "ubuntu/bionic64"
BASE_IP_MASTER = "10.0.0.10"

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  config.vm.provision "shell", inline: <<-SHELL
        apt-get update -y
        echo "10.0.0.10  master-node" >> /etc/hosts
        echo "10.0.0.11  worker-node01" >> /etc/hosts
  SHELL

  config.vm.define "master", primary: true do |master|
    master.vm.box = BASE_BOX_URL
    master.vm.hostname = "master-node"
    master.vm.network "public_network", ip: BASE_IP_MASTER, bridge: "en0: Wi-Fi (AirPort)"
    master.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    master.vm.provision :shell, :inline => "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys", run: "always"
    master.vm.synced_folder "./apps", "/home/vagrant/apps"
    master.vm.provider "virtualbox" do |v|
      v.memory = 3048
      v.cpus = 2
      v.name = "master-node"
    end

    master.trigger.after :up do |trigger|
      trigger.name = "Iniciar cluster Kubernetes"
      trigger.info = "Cluster iniciado com sucesso!!"
      master.vm.provision "shell", path: "kubernetes/cluster-init.sh"
    end

  end

  (1..1).each do |i|
    config.vm.define "node0#{i}" do |node|
      node.vm.box = BASE_BOX_URL
      node.vm.hostname = "worker-node0#{i}"
      node.vm.network "public_network", ip: "10.0.0.1#{i}", bridge: "en0: Wi-Fi (AirPort)"
      node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
      node.vm.provision :shell, :inline => "cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys", run: "always"
      node.vm.synced_folder "./apps", "/home/vagrant/apps"
      node.vm.provider "virtualbox" do |v|
        v.memory = 3048
        v.cpus = 2
        v.name = "worker-node0#{i}"
      end
    end
  end

  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end


end