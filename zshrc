# First we change the pallete on the terminal
$HOME/bin/ttypal

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="vlsd"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# determine what system we're running on
if [[ `uname -a` = *Debian* ]]; then
	print "Debian detected"
    distro=(debian)
    # add some stuff to the path
    eval PATH="/home/vlad/bin:"$PATH
    eval USRBINDIR="/usr/local/bin/"
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [[ `uname -a` = *ARCH* ]]; then
	print "ARCH detected"
	distro=(yaourt archlinux systemd sprunge)
    # add some stuff to the path
    eval PATH="/home/vlad/bin:"$PATH
    eval USRBINDIR="/usr/bin/"
    export PDFVIEW="/usr/bin/mupdf"
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [[ `uname -a` = *Darwin* ]]; then
	print "OSX detected"
    distro=(osx macports)
    # path needed for macports
    eval PATH="/opt/local/libexec/gnubin:/Users/vlad/bin:/opt/local/bin:"$PATH
    # use gnu-utils instead of bsd-utils. needs to be
    # loaded early in order to work
    # source $ZSH/plugins/gnu-utils/gnu-utils.plugin.zsh
    eval USRBINDIR="/opt/local/bin/"
    export LESSOPEN="| /opt/local/bin/src-hilite-lesspipe.sh %s"
else
	print "no known distro detected"
	distro=""
    USRBINDIR="/urs/bin/"
fi

plugins=(git git-extras cp rsync $distro python lol wakeonlan screen) 

source $ZSH/oh-my-zsh.sh


# Customize to your needs...
zstyle ':completion:*' use-cache on

# add syntax color and piping to less
export LESS=' -RXF '
export CLICOLOR_FORCE="true"

alias l='ls $LS_OPTIONS -a'
alias ll='ls $LS_OPTIONS -Alh'

alias sudo='nocorrect sudo'

# make vim default editor
export EDITOR="vim"
export VISUAL="vim"

# if vimpager is installed, use it
if [[ -x `which vimpager` ]]; then
    export PAGER=`which vimpager`
    alias less=$PAGER
    alias zless=$PAGER
    alias qless=$USRBINDIR"less"
fi

# locale stuff
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# disable git when mounting dagon over sshfs
zstyle ':vcs_info:' disable-patterns "$HOME/dagon(|/*)"
