#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$HOME/dotfiles/scripts"
export EDITOR=emacs

if [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]]; then
    exec dbus-launch --exit-with-session Hyprland
fi
