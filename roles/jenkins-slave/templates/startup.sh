#!/bin/bash

nohup java -jar {{ jenkins_home }}/agent.jar -jnlpUrl http://{{ jenkins_master_ip }}:{{ jenkins_master_port }}/computer/{{ jenkins_slave_name }}/slave-agent.jnlp -workDir {{ jenkins_home }} &
