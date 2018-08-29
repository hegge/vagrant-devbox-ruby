# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v, override|
    override.vm.box = "debian/contrib-stretch64"
  end

  config.ssh.forward_agent = true
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provision :shell, :inline => "sed -i 's/main$/main non-free contrib/g' /etc/apt/sources.list"
  config.vm.provision :shell, :inline => "sed -i 's/# en_DK.UTF-8/en_DK.UTF-8/' /etc/locale.gen && locale-gen"

  config.vm.provision :ansible, run: "always" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "devbox.yml"
  end
end
