#! /usr/bin/sh

sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update -y

sudo dnf install -y \
    chrome-gnome-shell \
    docker \
    gnome-tweaks \
    htop \
    httpie \
    pinta \
    python2-virtualenv \
    python3-virtualenv \
    tig \
    tmux \
    tree \
    util-linux-user \
    vim \
    vlc \
    xclip \
    zsh \

systemctl enable docker # reboot
sudo groupadd docker
sudo usermod -aG docker $USER # relogin

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
    com.slack.Slack \
    com.spotify.Client \
    com.valvesoftware.Steam \
    com.visualstudio.code \
    org.octave.Octave \
    org.signal.Signal \
    org.telegram.desktop \
    
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
# todo enable compose key left ctrl

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
