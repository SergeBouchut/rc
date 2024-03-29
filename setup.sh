#! /usr/bin/sh

sudo dnf -y install \
    fedora-workstation-repositories \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y update

sudo dnf -y install \
    htop \
    pinta \
    tig \
    tmux \
    tree \
    util-linux-user \
    vim \
    vlc \
    xclip \
    zsh
sudo chsh -s $(which zsh) ${USER}

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y \
    com.slack.Slack \
    com.spotify.Client \
    org.telegram.desktop
    
sudo dnf install snapd
# restart
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl enable docker --now

wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.gitconfig
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.tmux.conf
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.vimrc
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.zshrc
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/gnome-terminal-profiles.dconf
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
rm gnome-terminal-profiles.dconf

gnome-tweaks  # keyboard > compose key > enable > right ctrl

ssh-keygen -t ed25519 -C <email>
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
xclip -selection clip < ~/.ssh/id_ed25519.pub
# https://gitlab.com/-/profile/keys
# https://github.com/settings/keys
# https://console.scaleway.com/project/credentials
docker login registry.gitlab.com

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim  # :PluginInstall
