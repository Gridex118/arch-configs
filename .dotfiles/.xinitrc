#!/bin/sh
export XDG_SESSION_TYPE=x11

# setup input devices
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "SynPS/2 Synaptics Touchpad" "libinput Scrolling Enabled" 1
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" 0.2
xset r rate 270 30

# setup screen saver
xset s 1200 1200
xset dpms 1200 1200 1200

# load Xresources
xrdb .Xresources

# from default xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# setup ibus
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
ibus-daemon -dr

# start Openbox
exec awesome 
