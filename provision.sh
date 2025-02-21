#!/bin/bash
cat << EOT >> /etc/hosts
# Insere chave ssh na VM
EOT
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa SUA CHAVE SSH
EOT