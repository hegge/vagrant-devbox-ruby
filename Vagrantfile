# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v, override|
    override.vm.box = "debian/contrib-jessie64"
  end

  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.cmd     = ["/sbin/my_init", "--enable-insecure-key"]
    d.has_ssh = true
  end

  config.ssh.forward_agent = true

  # config.vm.provision :shell, :inline => "sed -i 's/main$/main non-free contrib/g' /etc/apt/sources.list"

  config.vm.provision :ansible do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end

  $script = <<-SCRIPT
  ln -sf /vagrant/src $HOME/src
  #ssh-keyscan -H enophook.resisty.net >> ~/.ssh/known_hosts
  #(test ! -d home && git clone torstein@enophook.resisty.net:/srv/git/torstein/home.git )
  #( cd home && git pull )
  ./home/symlink.sh >/dev/null
  test ! -f .gitconfig.local && printf "[push]\n\tdefault = upstream\n" >.gitconfig.local
  SCRIPT
  config.vm.provision :shell, inline: $script, privileged: false

  $script = <<-SCRIPT
  SCRIPT
  config.vm.provision :shell, inline: $script, privileged: false, run: "always"
end
