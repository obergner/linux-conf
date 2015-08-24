# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Useful color codes
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

# Our working directory
export WORKDIR=~/work

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Configure bash git prompt: https://github.com/magicmonty/bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=0
# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
GIT_PROMPT_START="[${LIGHT_RED}\A${COLOR_NONE}|${BLUE}\u${COLOR_NONE}@${LIGHT_GREEN}\h${COLOR_NONE}| ${LIGHT_GRAY}\W${COLOR_NONE}"
GIT_PROMPT_END=" ]\$ "
if [ -f ~/.profile.d/bash-git-prompt/gitprompt.sh ]; then
	. ~/.profile.d/bash-git-prompt/gitprompt.sh
fi

# Configure GCC: see http://askubuntu.com/questions/282666/make-gcc-coloring-the-default
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Configure Go
export GOPATH=${WORKDIR}/gopath
PATH=${PATH}:${GOPATH}/bin

# Load further customizations from .profile.d
if [ -d ~/.profile.d ]
then
	for config in ~/.profile.d/*.sh
	do
		source ${config}
	done
fi

# Get custom aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Export path when all other settings have been applied
export PATH
