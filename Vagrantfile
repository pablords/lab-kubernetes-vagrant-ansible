
BASE_BOX = "ubuntu/bionic64"
IMAGE_VERSION = "20230607.0.5"
MASTER_NAME = "master"
MASTER_IP = "192.168.50.10"
ANSIBLE_NAME = "ansible-server"
ANSIBLE_IP = "192.168.50.15"

# providers: libvirt, virtualbox
PROVIDER = "virtualbox"



vms = {
  "node1" => {
      :vm_cpu => 1, 
      :vm_ram => 1024, 
      :vm_ip => "192.168.50.21"
  },
  "node2" => {
    :vm_cpu => 1, 
    :vm_ram => 1024, 
    :vm_ip => "192.168.50.22"
  }
}


Vagrant.configure("2") do |config|
  config.vm.box = BASE_BOX
  # config.vm.box_version = IMAGE_VERSION
  config.vm.box_check_update = false
  config.ssh.insert_key = false


  config.vm.define "#{MASTER_NAME}" do |master|
    master.vm.network "private_network", ip: MASTER_IP
    master.vm.network "forwarded_port", guest: 8080, host: 8080
    master.vm.hostname = MASTER_NAME
    master.vm.synced_folder "./shared", "/home/vagrant/shared"
    master.vm.provider PROVIDER do |v|
      v.cpus = 1
      v.memory = 2048
    end
  end


  vms.each do | vm_name, vm_params |
    config.vm.define "#{vm_name}" do |node|
      node.vm.hostname = "#{vm_name}"
      node.vm.network "private_network", ip: "#{vm_params[:vm_ip]}"
      node.vm.provider PROVIDER do |v|
        v.cpus = "#{vm_params[:vm_cpu]}"
        v.memory = "#{vm_params[:vm_ram]}"
      end
    end
  end

  config.vm.define ANSIBLE_NAME do |server|
    server.vm.hostname = ANSIBLE_NAME
    server.vm.network "private_network", ip: ANSIBLE_IP
    server.vm.synced_folder "./ansible", "/home/vagrant/ansible"
    server.vm.provision :ansible_local do |ansible|
      ansible.playbook          = "playbook.yml"
      ansible.provisioning_path = "/home/vagrant/ansible"
      ansible.verbose           = true
      ansible.install           = true
      ansible.limit             = "all" # or only "nodes" group, etc.
      ansible.config_file       = "/home/vagrant/ansible/ansible.cfg"
      ansible.inventory_path    = "hosts.yml"
      ansible.compatibility_mode = "2.0"  
    end
    server.vm.provider PROVIDER do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end

end