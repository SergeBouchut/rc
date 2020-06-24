#! /usr/bin/sh

sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update -y

sudo dnf install -y \
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
    zsh \

    # chrome-gnome-shell \
    # libpq-devel \
    # postgresql \
    # python3-virtualenv \
    # qgis \    
    # spatialindex \
    # spatialindex-devel \

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf update -y
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER # logout or wait for reboot below
sudo systemctl start docker
sudo systemctl enable docker # reboot

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
    com.slack.Slack \
    org.signal.Signal \
    org.telegram.desktop \

    # com.spotify.Client \
    # com.valvesoftware.Steam \
    # com.visualstudio.code \
    # org.octave.Octave \
    
    # io.atom.Atom \
    # net.minetest.Minetest \

chsh -s $(which zsh) # relogin

wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.gitconfig
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.tmux.conf
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.vimrc
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.zshrc
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/gnome-terminal-profiles.dconf

dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" # reboot
# todo enable compose key right ctrl
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/enable-compose-key

ssh-keygen -t rsa -b 4096 -C "serge.bouchut@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

mkdir ~/dev
virtualenv ~/dev/.venv --python=python3
source ~/dev/.venv/bin/activate

pip install \
   ipython \
   
   # pgcli \
