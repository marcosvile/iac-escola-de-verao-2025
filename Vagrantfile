Vagrant.configure("2") do |config|
  config.vm.hostname = "webserver"
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "public_network", ip: "IP address", bridge: "interface de rede"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision "shell", path: "provision.sh"

  config.vbguest.auto_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
  config.vm.boot_timeout = 5000
end