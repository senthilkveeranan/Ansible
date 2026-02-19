Vagrant.configure("2") do |config|

  config.vm.box = "generic/rhel9"
  config.vm.hostname = "aap-rhel9"

  # Network
  config.vm.network "private_network", ip: "192.168.56.20"

  # Port forwarding (optional)
  config.vm.network "forwarded_port", guest: 22, host: 2222, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true

  # VirtualBox configuration
  config.vm.provider "virtualbox" do |vb|
    vb.name = "AAP-RHEL9-#{Time.now.to_i}"
    vb.memory = 20000
    vb.cpus = 4
  end

  # Disk resize (optional - recommended for AAP)
  config.disksize.size = "100GB"

  # Provision script
  config.vm.provision "shell", inline: <<-SHELL
    sudo dnf clean all
    sudo dnf -y update

    # Install basic tools
    sudo dnf -y install wget vim tar net-tools firewalld

    # Enable and start firewalld
    sudo systemctl enable firewalld
    sudo systemctl start firewalld

    echo "RHEL9 AAP Node Ready"
  SHELL

end

