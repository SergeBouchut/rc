#! /usr/bin/sh

sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update

sudo dnf install -y \
    chrome-gnome-shell \
    docker \
    gnome-tweaks \
    htop \
    httpie \
    pinta \
    python2-virtualenv \
    python3-virtualenv \
    tmux \
    tree \
    util-linux-user \
    vim \
    vlc \
    zsh \

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
    # com.slack.Slack \
    com.spotify.Client \
    # com.valvesoftware.Steam \
    # com.visualstudio.code \
    # io.atom.Atom \
    # net.minetest.Minetest
    # org.octave.Octave \
    # org.signal.Signal \
    org.telegram.desktop \

chsh -s $(which zsh)

wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.gitconfig
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.tmux.conf
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.vimrc
wget https://raw.githubusercontent.com/SergeBouchut/rc/master/.zshrc

ssh-keygen -t rsa -b 4096 -C "serge.bouchut@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

mkdir ~/dev
cd ~/dev

git clone git@github.com:SergeBouchut/rc.git
git clone git@github.com:SergeBouchut/patterns.git


# sudo dnf install \
#     zlib-devel \ 
#     libffi-devel \
#     openssl-devel \
#     sqlite-devel  # for ipython history

# wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz
# tar -xzvf Python-3.7.1.tar.xz
# cd Python-3.7.1
# ./configure --enable-optimizations
# make
# make test
# sudo -H make altinstall

virtualenv ~/dev/.venv2 --python=python2
virtualenv ~/dev/.venv3 --python=python3
