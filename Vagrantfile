Vagrant.configure("2") do |config|
  # Primeira máquina: Webserver
  config.vm.define "webserver" do |web|
    web.vm.hostname = "webserver"
    web.vm.box = "ubuntu/jammy64"
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.provision "shell", path: "provision.sh"
    web.vbguest.auto_update = false
    web.vbguest.installer_options = { allow_kernel_upgrade: true }
    web.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
    web.vm.boot_timeout = 5000
  end

  # Segunda máquina: Control Node (Para quem usa Windwos)
  # config.vm.define "controlnode" do |controlnode|
  #   controlnode.vm.hostname = "controlnode"
  #   controlnode.vm.box = "ubuntu/jammy64"
  #   controlnode.vm.network "private_network", ip: "192.168.56.11"
  #   controlnode.vm.provision "shell", path: "provision.sh"
  #   controlnode.vbguest.auto_update = false
  #   controlnode.vbguest.installer_options = { allow_kernel_upgrade: true }
  #   controlnode.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
  #   controlnode.vm.boot_timeout = 5000
  # end
end
