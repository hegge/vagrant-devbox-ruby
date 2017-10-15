# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v, override|
    override.vm.box = "debian/contrib-jessie64"
  end

  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.has_ssh = true
  end

  config.ssh.forward_agent = true

  config.vm.provision :shell, :inline => "sed -i 's/main$/main non-free contrib/g' /etc/apt/sources.list"

  $script = <<-SCRIPT
  ln -sf /vagrant/src $HOME/src
  exit 0
  SCRIPT
  config.vm.provision :shell, inline: $script, privileged: false

  config.vm.provision :ansible do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end

  $script = <<-SCRIPT
  SCRIPT
  config.vm.provision :shell, inline: $script, privileged: false, run: "always"
end
