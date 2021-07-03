#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# monitor configuration
hdmi_connected=`xrandr | grep HDMI`

if [ -z "$hdmi_connected" ]; then
    echo "no hay monitor"
else
    hdmi_resolution=`xrandr | grep -A 1 "HDMI" | grep -oP "[0-9]+x[0-9]+\s"`
    case "$hdmi_resolution" in
        "3840x2160 ")
            `~/.screenlayout/1440p_hdmi_only.sh`
            ;;
        "1920x1080 ")
            `~/.screenlayout/hd_hdmi_only.sh`
            ;;
        *)
            echo "sepa puta"
    esac
fi

/usr/bin/prime-offload &

# slstatus &
# exec dwm
# feh --bg-fill $HOME/.wallpapers/mountains_peaks_snow.jpg
exec bspwm
