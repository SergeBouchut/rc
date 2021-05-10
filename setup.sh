#! /usr/bin/sh

sudo dnf -y install \
    fedora-workstation-repositories \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y update

sudo dnf -y install \
    gnome-tweaks \
    htop \
    httpie \
    pinta \
    tig \
    tmux \
    tree \
    util-linux-user \
    vim \
    vlc \
    xclip \
    zsh

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
sudo systemctl enable docker --now

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
    com.slack.Slack \
    org.telegram.desktop

chsh -s $(which zsh)

wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.gitconfig
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.tmux.conf
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.vimrc
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.zshrc

# wget https://raw.githubusercontent.com/SergeBouchut/rc/master/gnome-terminal-profiles.dconf
# dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf

# todo enable compose key right ctrl

ssh-keygen -t rsa -b 4096 -C "serge.bouchut@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
# https://gitlab.com/-/profile/keys
# https://github.com/settings/keys
# https://console.scaleway.com/project/credentials
