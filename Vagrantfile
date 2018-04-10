CENTOS = 'bento/centos-7.4'
UBUNTU = 'bento/ubuntu-17.10'

MASTER = { :box => CENTOS,
           :hostname => 'master',
           :ip => "192.168.68.11" }

SLAVE  = { :box => CENTOS,
           :hostname => 'slave',
           :ip => "192.168.68.12" }

Vagrant.configure('2') do |config|
  config.vm.define MASTER[:hostname] do |host|
    host.vm.box = MASTER[:box]
    host.vm.hostname = MASTER[:hostname]
    host.vm.network 'private_network', ip: MASTER[:ip]

    config.vm.provision 'ansible_local' do |ansible|
      ansible.provisioning_path = '/vagrant'
      ansible.inventory_path = 'hosts'
      ansible.playbook = 'master.yml'
      ansible.version = '2.5.0'
    end
  end

  config.vm.define SLAVE[:hostname] do |host|
    host.vm.box = SLAVE[:box]
    host.vm.hostname = SLAVE[:hostname]
    host.vm.network 'private_network', ip: SLAVE[:ip]

    config.vm.provision 'ansible_local' do |ansible|
      ansible.provisioning_path = '/vagrant'
      ansible.inventory_path = 'hosts'
      ansible.playbook = 'slave.yml'
      ansible.version = '2.5.0'
    end
  end
end
