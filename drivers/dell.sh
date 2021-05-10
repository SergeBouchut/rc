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
