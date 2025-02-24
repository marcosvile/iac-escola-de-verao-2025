# Projeto IaC Escola de Verão 2025

Este projeto configura um servidor web NGINX utilizando Vagrant e Ansible.

## Estrutura do Projeto

- `Vagrantfile`: Configura a VM com Vagrant.
- `provision.sh`: Script de provisionamento para a VM.
- `playbook.yaml`: Playbook do Ansible para configurar o NGINX.
- `roles/nginx/tasks/main.yaml`: Tarefas principais para instalar e configurar o NGINX.
- `roles/nginx/tasks/configure.yaml`: Tarefas para configurar arquivos específicos do NGINX.
- `roles/nginx/handlers/main.yaml`: Handlers para gerenciar o serviço NGINX.
- `inventories/hosts`: Arquivo de inventário do Ansible.
- `.gitignore`: Arquivo para ignorar arquivos desnecessários no Git.
- `.editorconfig`: Configurações do EditorConfig.

## Pré-requisitos

- Vagrant
- VirtualBox
- Ansible

### Instalação dos Pré-requisitos

#### Vagrant

Para instalar o Vagrant, execute os seguintes comandos:

```bash
# Para sistemas baseados em Debian/Ubuntu
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

#### VirtualBox

Para instalar o VirtualBox, execute os seguintes comandos:

```bash
# Para sistemas baseados em Debian/Ubuntu
sudo apt update
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt update
sudo apt install -y linux-headers-$(uname -r) dkms
sudo apt install virtualbox-7.0 -y
vagrant plugin install vagrant-vbguest
```

#### Ansible

Para instalar o Ansible, execute os seguintes comandos:

```bash
# Para sistemas baseados em Debian/Ubuntu
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

## Como usar

1. Clone o repositório:
    ```bash
    git clone <URL_DO_REPOSITORIO>
    cd iac-escola-de-verao-2025
    ```

2. Edite o arquivo `provision.sh` para adicionar sua chave SSH:
    ```bash
    nano provision.sh
    ```
    Substitua o conteúdo da chave SSH pelo seu próprio conteúdo.

3. Edite o arquivo `Vagrantfile` para adicionar o endereço IP e a interface de rede:
    ```bash
    nano Vagrantfile
    ```
    Substitua `IP address` pelo endereço IP desejado e `interface de rede` pela interface de rede a ser utilizada como bridge. O IP Address deve ser um IP da mesma rede que sua máquina host.

4. Faça uma cópia do arquivo `.env.example` para `.env` e edite-o com suas configurações:
    ```bash
    cp .env.example .env
    nano .env
    ```

5. Inicie a VM com Vagrant:
    ```bash
    vagrant up
    ```

6. Execute o playbook do Ansible:
    ```bash
    ansible-playbook -i inventories/hosts -u vagrant playbook.yaml
    ```

## Licença

Este projeto está licenciado sob a licença MIT.
