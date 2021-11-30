
BASE_BOX = "ubuntu/trusty64"
MASTER_NAME = "cluster"
MASTER_IP = "192.168.50.10"
CIDR = "192.168.0.0/16"


Vagrant.configure("2") do |config|
  config.vm.box = BASE_BOX
  config.vm.box_check_update = false
  config.ssh.insert_key = true

  (1..1).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.50.2#{i}"
      node.vm.provider "virtualbox" do |v|
        v.name = "node#{i}"
      end
    end
  end

  config.vm.define MASTER_NAME do |master|
    master.vm.hostname = MASTER_NAME
    master.vm.network "private_network", ip: MASTER_IP
    master.vm.synced_folder "./ansible", "/home/vagrant/ansible"
    master.vm.synced_folder "./apps", "/home/vagrant/apps"
    master.vm.provision :ansible_local do |ansible|
      ansible.playbook          = "playbook.yml"
      ansible.provisioning_path = "/home/vagrant/ansible"
      ansible.verbose           = true
      ansible.install           = true
      ansible.limit             = "all" # or only "nodes" group, etc.
      ansible.config_file       = "/home/vagrant/ansible/ansible.cfg"
      ansible.extra_vars = {
        ansible_ssh_user: "vagrant",
        ansible_ssh_pass: "vagrant",
        master_ip: MASTER_IP,
        cidr: CIDR
      }
      ansible.host_vars = {
        "node1" => {
          "ansible_host" => "192.168.50.21"
        }
      }
      ansible.groups = {
        "nodes" => ["node1"],
        "nodes:vars" => {
          "node_ip" => "192.168.50.21"
        }
      }
    end
    master.vm.provider "virtualbox" do |v|
      v.memory = 3048
      v.cpus = 2
      v.name = MASTER_NAME
    end
  end

end