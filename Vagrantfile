# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/contrib-jessie64"

  # config.vm.provision :shell, :inline => "sed -i 's/main$/main non-free contrib/g' /etc/apt/sources.list"
  
  config.vm.provision :ansible do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end
end
