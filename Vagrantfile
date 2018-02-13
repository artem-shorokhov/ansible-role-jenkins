BOX    = "bento/centos-7.4"
           
MASTER = { :box => BOX,
           :hostname => "master",
           :ip => "192.168.68.11" }
		   
SLAVE  = { :box => BOX,
           :hostname => "slave",
           :ip => "192.168.68.12" }
           
Vagrant.configure("2") do |config|
  
  config.vm.define MASTER[:hostname] do |host|
  
    host.vm.box = MASTER[:box]
    host.vm.hostname = MASTER[:hostname]
    host.vm.network "private_network", ip: MASTER[:ip]
    
    config.vm.provision "ansible_local" do |ansible|
      ansible.provisioning_path = "/vagrant"
      ansible.inventory_path = "hosts"
      ansible.playbook = "master.yml"
    end
    
  end

end
