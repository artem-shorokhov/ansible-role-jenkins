#!groovy

import hudson.security.*

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
