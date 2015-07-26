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
    eval USRBINDIR="/usr/bin/"
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
    distro=(osx macports vagrant pip git-flow mercurial fabric)
    # path needed for macports
    eval PATH="~/bin:/opt/local/libexec/gnubin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/vlad/bin:/opt/local/bin:"$PATH
    # use gnu-utils instead of bsd-utils. needs to be
    # loaded early in order to work
    # source $ZSH/plugins/gnu-utils/gnu-utils.plugin.zsh
    eval USRBINDIR="/opt/local/bin/"
    export LESSOPEN="| /opt/local/bin/src-hilite-lesspipe.sh %s"

    # choose between Skim and Preview as a pdf viewer
    if [[ -a "/Applications/Skim.app/" ]]; then
        export PDFVIEW="open -a Skim"
    else
        export PDFVIEW="open -a Preview"
    fi

else
	print "no known distro detected"
	distro=""
    USRBINDIR="/urs/bin/"
    eval PATH="~/bin:"$PATH
fi

plugins=(git git-extras cp rsync $distro python lol wakeonlan screen) 

source $ZSH/oh-my-zsh.sh


# Customize to your needs...
zstyle ':completion:*' use-cache on

# add syntax color and piping to less
export LESS=' -RXF '
export CLICOLOR_FORCE="true"

# alias crep to mean grep with color=always ; used when piping into less, e.g.
alias crep='grep --color=always'

# useful ls aliases
alias l='ls $LS_OPTIONS -a'
alias ll='ls $LS_OPTIONS -Alh'


# what does this do again?
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

# if ros is installed
# pick out what version of ros we are using
export ROS_DISTRO="groovy"
if [[ -a /opt/ros/$ROS_DISTRO/setup.zsh ]]; then
    source /opt/ros/$ROS_DISTRO/setup.zsh
fi

# also load the allegro_hand environment if it is installed
if [[ -a ~/allegro_ws/setup.zsh ]]; then
    source ~/allegro_ws/setup.zsh
fi

# setting up virtualenv for python
WORKON_HOME=~/.virtualenvs
mkdir -p ${WORKON_HOME}
vew=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
if [ -e ${vew} ]; then
    source ${vew}
fi

# Call virtualenvwrapper's "workon" if .venv exists. This is modified from--
# http://justinlilly.com/python/virtualenv_wrapper_helper.html
# which is linked from--
# http://virtualenvwrapper.readthedocs.org/en/latest/tips.html#automatically-run-workon-when-entering-a-directory
check_virtualenv() {
    if [ -e .venv ]; then
        env=`cat .venv`
        if [ "$env" != "${VIRTUAL_ENV##*/}" ]; then
            echo "Found .venv in directory. Calling: workon ${env}"
            workon $env
        fi
    fi
}

venv_cd () {
    builtin cd "$@" && check_virtualenv
}

# Call check_virtualenv in case opening directly into a directory (e.g
# when opening a new tab in Terminal.app).
check_virtualenv
 
# Add the following to ~/.bash_aliases:
alias cd="venv_cd"
 
# also, for fun, add something like `pyfiglet "env : $1"` to ~/.virtualenv/preactivate

# The next line updates PATH for the Google Cloud SDK.
source '/Users/vlad/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/vlad/google-cloud-sdk/completion.zsh.inc'
