# Jenkins master + slave Ansible role

## Requirements

- Virtual Box
- Vagrant

## Options

- anonymous read access is controlled by `allow_anonymous_read` variable in `roles\jenkins-master\vars\main.yml`
- additional users could be added via `jenkins_users` variable in `roles\jenkins-master\vars\main.yml`
- any of Debian or RedHat family OS are supported for Jenkins slave (defined in Vagrantfile)
