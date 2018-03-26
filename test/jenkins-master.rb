control 'packages' do
  impact 1.0
  title 'Required packages should be installed.'
  describe package('jenkins') do
    it { should be_installed }
  end
end

control 'config-file' do
  impact 1.0
  title 'Configuration file should be in place.'
  describe file('/etc/sysconfig/jenkins') do
    it { should exist }
    its('content') { should match JENKINS_JAVA_OPTIONS="-Djenkins.install.runSetupWizard=false" }
  end
end

control 'init-scripts' do
  impact 0.3
  title 'Groovy init files should be absent.'
  describe file('/var/lib/jenkins/init.groovy.d/basic-security.groovy') do
    it { should_not exist }
  end
  describe file('/var/lib/jenkins/init.groovy.d/users.groovy') do
    it { should_not exist }
  end
end

control 'jenkins-service' do
  impact 1.0
  title 'Jenkins service should be installed/enabled/running.'
  describe service('jenkins') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'port-is-open' do
  impact 1.0
  title 'Jenkins should be listening on port 8080.'
  describe port(8080) do
    it { should be_listening }
    its('processes') { should include 'java' }
  end
end
