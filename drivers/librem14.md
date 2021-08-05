# Touchpad

## Issue

Using gnome tweaks, choose area option for touchpad. Right click not working.

## Versions

- fedora 34
- kernel 5.12.14-300
- libinput 1.18.0-2

## Solution

Create file `/etc/libinput/local-overrides.quirks` with content:
```
[Librem 14v1 Touchpad]
MatchName=HTIX5288:00 0911:5288 Touchpad
MatchUdevType=touchpad
MatchDMIModalias=dmi:*svnPurism:*pvr1.0*
AttrEventCodeDisable=BTN_RIGHT
```

## Resources

https://forums.puri.sm/t/librem-14-touchpad-right-click-button-not-detected-on-arch/13901

# Battery charging

## Issue

Battery not charging.

## Versions

- fedora 34
- kernel 5.12.14-300 / 5.13.6-200

## Solution

Install Librem EC firmware (there is a Debian package `librem-ec-acpi-dkms`).

```
sudo dnf install dkms
git clone https://source.puri.sm/nicole.faerber/librem-ec-acpi-dkms.git
cd librem-ec-acpi-dkms
cp debian/librem-ec-acpi-dkms.dkms dkms.conf
vim dkms.conf  # change PACKAGE_VERSION="1.0"
sudo dkms add ./
sudo dkms build librem_ec_acpi/1.0
sudo dkms install librem_ec_acpi/1.0
lsmod | grep librem_ec_acpi
```

Change charging start and end threshold.

```
sudo vim /sys/class/power_supply/BAT0/charge_control_start_threshold  # 40 (battery won't start charging above, but will continue if charge already started)
sudo vim /sys/class/power_supply/BAT0/charge_control_start_threshold  # 95
```

## Resources

https://forums.puri.sm/t/librem-14-failed-to-charge-solved/13935
