#!groovy

import hudson.security.*
import jenkins.model.*

def instance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount('{{ jenkins_admin_username }}', '{{ jenkins_admin_password }}')

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead({{ allow_anonymous_read }})

instance.getDescriptor("jenkins.CLI").get().setEnabled(false)
instance.setSecurityRealm(hudsonRealm)
instance.setAuthorizationStrategy(strategy)
instance.save()
