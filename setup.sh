vagrant up

# allow node1 to ssh node2
vagrant ssh-config node1 > ssh_config
scp -F ssh_config \
    .vagrant/machines/node2/virtualbox/private_key \
    node1:.ssh/id_rsa
