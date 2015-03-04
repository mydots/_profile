# Global profile. Override with your own ~/.profile.

#UID="$(id -u)"
# Environment
# ===========

os="$(uname -s)"


# Escape sequence done by tying: Ctrl+v+[ in vim
# Define color escape sequences.
export    BLUE="[0;34m" 
export   GREEN="[0;32m" 
export    CYAN="[0;36m" 
export     RED="[0;31m" 
export  PURPLE="[0;35m" 
export   LGREY="[0;37m" 
export    GREY="[1;30m" 
export   LBLUE="[1;34m" 
export  LGREEN="[1;32m" 
export   LCYAN="[1;36m" 
export    LRED="[1;31m" 
export LPURPLE="[1;35m" 
export  YELLOW="[1;33m" 
export   WHITE="[1:37m" 
export DEFAULT="[0;39m" 
                           


if [[ $os = "Darwin" ]]; then
	# Setup the PATH.
	PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

	# MacPorts Installer addition 
	PATH=/opt/local/bin:/opt/local/sbin:$PATH

  # Android SDK
  PATH="/Applications/Android/sdk/platform-tools:/Applications/Android/sdk/tools:$PATH"

	# For bash completion. Need to install from ports bash-completion
	if [ -f /opt/local/etc/profile.d/bash_completion ]; then
		. /opt/local/etc/profile.d/bash_completion
	fi

	# SSH Host bash completion
	[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh


elif [[ $os = "Linux" ]]; then

	alias ls="ls --color" # Get colors 

elif [[ $os = "OpenBSD" ]]; then 

	# First, find out who we are numerically.
	UID=`id -u`

	alias ls="colorls -G" # Get colors 
	alias su="su -"       # Sett access to root
	
fi

if [[ $os = "Darwin" || $os = "Linux" ]]; then
	# Set access to root
	alias su="sudo su"       
fi

if [[ $os = "OpenBSD" || $os = "Linux" ]]; then
	# Setup the PATH.
	# Set a basic one, append sbin directories if we are root, then export.
	PATH="/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/usr/games"
	if [ "$UID" = "0" ]; then
		PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"
	fi

	# Set colors to the terminal
	TERM=xterm-color

	alias mplayer="mplayer -fs -zoom"	# Get mplayer to play full screen
fi

# Setup the PATH.
PATH=~/.dotFiles/profile/bin:$PATH
export PATH

# Setup a colorized prompt, the way I like it
# XXX Should only use colors with a color capable terminal.

# Start Prompt
PS1="["

# User@host: directory
PS1="${PS1}\[\033[31m\]\u\[\033[39m\]@\[\033[32m\]\h\[\033[39m\]: \[\033[34m\]\w\[\033[39m\]"

# Git branch in prompt 
PS1=''${PS1}'`git branch 2>/dev/null | grep -e ^* | sed -e s/\*\ /\[\033[33m\]\\ \(/g -e s/\$/\)\[\033[39m\]/g`'

# End Prompt
PS1="${PS1}]$ "

# Validate previous command
#PS1="\$(if [[ \$? == 0 ]]; then echo \"\[\033[32m\]\342\234\223\"; else echo \"\[\033[31m\]\342\234\227\"; fi) \[\033[39m\]$PS1"

# Export Prompt
export PS1

# If we are using an xterm-* terminal, set the window title to PS1.
if [ "$TERM" = "xterm" -o "$TERM" = "xterm-color" -o "$TERM" = "xterm-256color" ]; then
	export PS1="\[]0;\u@\h:\w\]$PS1"
fi
	
# Get Color in prompt
export CLICOLOR=1

#Output of grep contains colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='35'

# Set terminal to store only unique commands in the history
export HISTCONTROL=ignoredups:erasedups

# Ignore commands from history
export HISTIGNORE="history:ls:ll:lla:l1:pwd:clear"

# Save History
export HISTFILE=~/.bash_history

# Append history entries
shopt -s histappend

# After each command, save and reload history (available across all terminal windows)
export PROMPT_COMMAND="history -a; history -c; history -r; history -a; history -c; history -r"

# VI style editing in BASH
set -o vi

# Set history length
export HISTFILESIZE=3000

# Use vim as default pager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'nnoremap <space> <C-F>| nnoremap q :q<cr>| set ft=man ts=8 nomod nolist nonu noma' -\""

# Load specific files
. ~/.dotFiles/profile/alias
. ~/.keys
. ~/.dotFiles/git/git-completion.bash


# Keep the environment clean :P.
unset BLACK BLUE GREEN CYAN RED PURPLE BROWN LGREY GREY \
      LBLUE LGREEN LCYAN LRED LPURPLE YELLOW WHITE DEFAULT

# Define color escape sequences (Uncomment for openbsd)
# export   BLACK="\[[0;30m\]"
# export    BLUE="\[[0;34m\]"
# export   GREEN="\[[0;32m\]"
# export    CYAN="\[[0;36m\]"
# export     RED="\[[0;31m\]"
# export  PURPLE="\[[0;35m\]"
# export   BROWN="\[[0;33m\]"
# export   LGREY="\[[0;37m\]"
# export    GREY="\[[1;30m\]"
# export   LBLUE="\[[1;34m\]"
# export  LGREEN="\[[1;32m\]"
# export   LCYAN="\[[1;36m\]"
# export    LRED="\[[1;31m\]"
# export LPURPLE="\[[1;35m\]"
# export  YELLOW="\[[1;33m\]"
# export   WHITE="\[[1:37m\]"
# export DEFAULT="\[[0;39m\]"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"   
eval "$(rbenv init -)"

export EDITOR=vim
