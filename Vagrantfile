$run_script = <<SCRIPT
  export DISPLAY=#{ENV['VAGRANT_DISPLAY']}
  ~/idea.sh #{ENV['VAGRANT_GIT_IDEA_SETTINGS_REPO']}
SCRIPT

$install_script = <<SCRIPT
  chmod -R ugo+rwx /tmp/custom-config
  /tmp/custom-config/install.sh
SCRIPT

$install_tools_script = <<SCRIPT
  /tmp/custom-config/install_tools.sh
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "archlinux/archlinux"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
   vb.memory = "4024"
   vb.cpus = 2
  end

  config.vm.synced_folder "../", "/home/vagrant/IdeaProjects"

  config.vm.provision "file", source: "config", destination: "/tmp/custom-config"
  config.vm.provision "shell", inline: $install_script, privileged: false
  config.vm.provision "shell", inline: $install_tools_script, privileged: false

  config.vm.provision "shell", inline: $run_script, privileged: false, run: 'always'

end

#linux: sudo vagrant ssh -c './idea.sh'
#windows: vagrant up
#.\Xming.exe  -clipboard -multiwindow -ac

