##### wifi dongle

uname -r  # kernel version
# 5.11.12-300.fc34.x86_64

lsusb  # devices info
# TP-Link Archer T3U [Realtek RTL8812BU]

# https://doc.ubuntu-fr.org/wifi_liste_carte#realtek
# rtl8812au seems to be compatible (with custom install) but no mention of rtl8812bu

# https://wireless.wiki.kernel.org/en/users/drivers/rtl819x
# https://en.wikipedia.org/wiki/Comparison_of_open-source_wireless_drivers

# https://github.com/morrownr/88x2bu
sudo dnf -y update
sudo dnf -y install git dkms kernel-devel kernel-debug-devel
git clone https://github.com/morrownr/88x2bu.git
cd 88x2bu
sudo ./install-driver.sh

# if kernel headers version not match kernel version
# sudo dnf -y install "kernel-devel-uname-r == $(uname -r)"
# sudo ./remove-driver.sh

##### graphic card

lspci -v | grep VGA
# NVIDIA Corporation GM107GL [Quadro K620]

# https://www.nvidia.com/Download/Find.aspx?lang=en-us
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/465.27/NVIDIA-Linux-x86_64-465.27.run
chmod +x NVIDIA-Linux-x86_64-465.27.run

sudo dnf -y install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig

vim /etc/default/grub  # append `rd.driver.blacklist=nouveau` to `GRUB_CMDLINE_LINUX`
# GRUB_CMDLINE_LINUX="rhgb quiet rd.driver.blacklist=nouveau"
grub2-mkconfig -o /boot/grub2/grub.cfg

sudo dnf -y remove xorg-x11-drv-nouveau

mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
dracut /boot/initramfs-$(uname -r).img $(uname -r)

sudo systemctl set-default multi-user.target
sudo reboot

sudo ./NVIDIA-Linux-x86_64-465.27.run  # yes

systemctl set-default graphical.target
reboot

sudo dnf install vdpauinfo libva-vdpau-driver libva-utils

