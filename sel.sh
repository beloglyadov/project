sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
systemctl disable firewalld
chmod +rx /tmp/project/proj.sh

reboot
