# $script = <<SCRIPT
# SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/opt/arm-clfs"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
    # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on]
    # vb.customize ["modifyvm", :id, "--natdnsproxy1", "on]
    # vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # config.vm.provision "initial-setup", type: "shell", inline: $script
end
