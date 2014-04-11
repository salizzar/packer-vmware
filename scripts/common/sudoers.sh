#
# Sudoers steps.
#

cat > /tmp/vagrant <<-VAGRANT
Defaults:%admin !requiretty
%admin ALL=(ALL) NOPASSWD:ALL
VAGRANT

# centos 5 does not have sudoers.d dir
if [ ! -d /etc/sudoers.d ] ; then
  cat /tmp/vagrant >> /etc/sudoers
else
  # fix permission
  chmod 0440 /tmp/vagrant

  # create file
  mv /tmp/vagrant /etc/sudoers.d/
fi

