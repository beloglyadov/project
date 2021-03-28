sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
systemctl disable firewalld

cd /tmp/
yum install git -y
git clone https://github.com/beloglyadov/project
reboot
