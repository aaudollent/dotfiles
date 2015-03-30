#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ ' default
PS1='\[\e[1;37m\][\u@\e[1;34m\]\h \W\e[1;37m\]]\$\[\e[0m\] '

export EDITOR='vim'
export BROWSER='firefox-developer-edition'
export VDPAU_DRIVER=va_gl
export USE_CCACHE=1
export CCACHE_DIR=/mnt/storage/.ccache
export QEMU_AUDIO_DRV=alsa

# core stuff
alias v='vim'
alias vi='vim'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias lla='ll -a'
alias wifi='sudo wifi-menu'
alias mp='mpv'
alias sx='sxiv'
alias umus='udevil umount /media/* && lsblk -f'
alias aurget='aurget --deps'

# xrandr stuff
alias xr0='xrandr --output LVDS1 --mode 1280x800 --pos 0x0 --primary && xrandr --output VGA1 --off && feh --bg-center ~/.wp'
alias 226='xrandr --output VGA1 --mode 1680x1050 --left-of LVDS1 && xrandr --output LVDS1 --primary && feh --bg-center ~/.wp'
alias 26='xrandr --output VGA1 --mode 1680x1050 --pos 0x0 --primary && xrandr --output LVDS1 --off'

# source /usr/share/git/completion/git-completion.bash

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- -keeptty -nolisten tcp > ~/.xorg.log 2>&1

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

	# Show the currently running command in the terminal title:
	# http://www.davidpashley.com/articles/xterm-titles-with-bash.html
	show_command_in_title_bar()
	{
		case "$BASH_COMMAND" in
			*\033]0*)
				# The command is trying to set the title bar as well;
				# this is most likely the execution of $PROMPT_COMMAND.
				# In any case nested escapes confuse the terminal, so don't
				# output them.
				;;
			*)
				echo -ne "\033]0;${USER}@${HOSTNAME}: ${BASH_COMMAND}\007"
				;;
		esac
	}
	trap show_command_in_title_bar DEBUG
	;;
*)
	;;
esac
