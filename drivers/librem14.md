# Touchpad

## Issue

Using gnome tweaks, choose area option for touchpad. Right click not working.

## Versions

- fedora 34
- kernel 5.12.14-300
- libinput 1.18.0-2

## Workaround

Create file `/etc/libinput/local-overrides.quirks` with content:
```
[Librem 14v1 Touchpad]
MatchName=HTIX5288:00 0911:5288 Touchpad
MatchUdevType=touchpad
MatchDMIModalias=dmi:*svnPurism:*pvr1.0*
AttrEventCodeDisable=BTN_RIGHT
```

## Resources

https://forums.puri.sm/t/librem-14-touchpad-right-click-button-not-detected-on-arch/13901/13
