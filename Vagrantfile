$run_script = <<SCRIPT
  export DISPLAY=#{ENV['VAGRANT_DISPLAY']}
  ~/idea.sh
SCRIPT

$install_script = <<SCRIPT
  export GIT_USER=#{ENV['VAGRANT_GIT_USER']}
  export GIT_TOKEN=#{ENV['VAGRANT_GIT_TOKEN']}
  export GIT_IDEA_SETTINGS=#{ENV['VAGRANT_GIT_IDEA_SETTINGS']}
  chmod -R ugo+rwx /tmp/custom-config
  /tmp/custom-config/install.sh
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "archlinux/archlinux"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
   vb.memory = "4024"
   vb.cpus = 2
  end

  config.vm.synced_folder "../", "/home/vagrant/IdeaProjects", type: "rsync"

  config.vm.provision "file", source: "config", destination: "/tmp/custom-config"
  config.vm.provision "shell", inline: $install_script, privileged: false

  config.vm.provision "shell", inline: $run_script, privileged: false, run: 'always'

end

#.\Xming.exe  -clipboard -multiwindow -ac