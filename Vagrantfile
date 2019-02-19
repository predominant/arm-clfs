# $script = <<SCRIPT
# SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/cosmic64"
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/opt/arm-clfs"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  # config.vm.provision "initial-setup", type: "shell", inline: $script
end
