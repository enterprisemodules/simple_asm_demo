if [ -f /opt/puppetlabs/bin/puppet ]
then
  echo "Puppet already installed"
else
  #
  # Install correct puppet version
  #
  if [ -f "/vagrant/puppet_version" ]; then
    PACKAGE="puppet-agent-$(cat /vagrant/puppet_version)"
  else
    PACKAGE="puppet-agent"
  fi
  echo "Installing $PACKAGE"
  rhel=$(sed -n 's/^VERSION_ID="\(.\)\..".*/\1/p' /etc/os-release)
  yum install -y --nogpgcheck https://yum.puppetlabs.com/puppet-release-el-${rhel}.noarch.rpm > /dev/null
  yum install -y --nogpgcheck $PACKAGE
  rpm -q git || yum install -y --nogpgcheck git
  touch /var/log/install_puppet.done
fi