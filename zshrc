# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory nomatch
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vlad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# arrow-key driven completion
zstyle ':completion:*' menu select
# complete aliases
setopt completealiases
zstyle ":completion:*:commands" rehash 1

# Customize to your needs...
export PATH=$HOME/bin:/usr/bin/:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# this sends the name of the current command to screen
preexec () {
    if [[ "$TERM" == "screen" ]]; then
        local CMD=${1[(wr)^(*=*|sudo|-*)]}
        echo -ne "\ek$CMD\e\\"
    fi
}

function wol {
    wakeonlan -i $1 00:30:67:22:4d:47
}

# default editor is vim, but command line key bindings are emacs
EDITOR="/usr/bin/vim"
bindkey -e

# custom aliases
alias vless='/usr/share/vim/vim73/macros/less.sh'

# add syntax color and piping to less
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export CLICOLOR_FORCE="true"

# force color in grep
alias grep="grep --color=always"

# color listing
eval $(dircolors)
zstyle ':completion' list-colors "${(s.:.)LS_COLORS}"

# colorize man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

if [ "$(whoami)" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="blue"
fi

source ~/.zsh/theme-and-appearance.zsh
source ~/.zsh/git.zsh

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{${fg_bold[magenta]}%} :: %{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git

source /usr/share/doc/pkgfile/command-not-found.zsh
alias pac=packer-color
