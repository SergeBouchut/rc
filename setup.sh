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
#     sqlite-devel \ # for ipython history

# wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz
# tar -xzvf Python-3.7.1.tar.xz
# cd Python-3.7.1
# ./configure --enable-optimizations
# make
# make test
# sudo -H make altinstall

virtualenv ~/dev/.venv2 --python=python2
virtualenv ~/dev/.venv3 --python=python3

# pip install \
#    ipython \
#    pgcli \
    
echo"
visible-name='serge'
login-shell=false
palette=['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']
custom-command="gnome-terminal -e 'tmux new-session -A -s main'"
default-size-columns=95
default-size-rows=50
use-system-font=false
use-custom-command=true
use-transparent-background=true
exit-action='close'
font='Monospace 13'
audible-bell=false
background-transparency-percent=0
" | dconf load /org/gnome/terminal/legacy/profiles:/$(dconf list /org/gnome/terminal/legacy/profiles:/)
