#!/bin/sh

sudo apt install -y \
    chrome-gnome-shell \
    git \
    git-flow \
    gnome-tweaks \
    htop \
    httpie \
    libpq-dev \
    pinta \
    pg-cli \
    postgresql-client \
    python-dev \
    python3-dev \
    python-pip \
    python3-pip \
    python3-venv \
    qgis \
    tig \
    tmux \
    tree \
    vim \
    virtualenv \
    vlc \
    xclip \
    zsh

# install docker https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo usermod -aG docker sbouchut@forcity.local

# install docker-compose https://docs.docker.com/compose/install/
# configure zsh completion https://docs.docker.com/compose/completion/#zsh

ssh-keygen -o -t rsa -b 4096 -C "serge.bouchut@forcity.com"
# enter passphrase
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
# paste public key in https://gitlab.com/profile/keys

mkdir ~/.pip
echo "
[global]
extra-index-url = https://pip@forcity.io:pl7ej23q8JA4O49ieZ6kv78iSWBzm3lr@devpi.forcity.io/forcity/dev/+simple/
trusted-host = devpi.forcity.io
" > ~/.pip/pip.conf

docker login registry-v2.forcity.io
# enter ldap credentials

echo "
override_shell = /usr/bin/zsh
" > /etc/sssd/sssd.conf
sudo service sssd restart
