# Jenkins master + slave Ansible role with InSpec tests run by KitchenCI

## Requirements

- Virtual Box
- Vagrant
- Chef Development Kit

## Options

- anonymous read access is controlled by `allow_anonymous_read` variable in `roles\jenkins-master\vars\main.yml`
- additional users could be added via `jenkins_users` variable in `roles\jenkins-master\vars\main.yml`
- any of Debian or RedHat family OS are supported for Jenkins slave

## Notable commands

### KitchenCI

- `kitchen create` - create virtual machine
- `kitchen converge` - provision created instance with Ansible playbook
- `kitchen verify` - run InSpec tests against provisioned instance
- `kitchen destroy` - destroy virtual machine
- `kitchen test` - same as running `kitchen destroy` (if instance exists) > `kitchen create` > `kitchen converge` > `kitchen verify` > `kitchen destroy`
- `kitchen login` - connect to virtual machine via SSH

### Vagrant

- `vagrant up` - create virtual machine and provision it with Ansible playbook
- `vagrant ssh` - login into virtual machine
