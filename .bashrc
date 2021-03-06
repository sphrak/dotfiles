# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export EDITOR=nvim

if [ ! -d ~/.history/$(date -u +%Y/)/${HOSTNAME} ]; then
    mkdir -p ~/.history/$(date -u +%Y/)/${HOSTNAME}
fi

export HISTFILE="${HOME}/.history/$(date -u +%Y)/${HOSTNAME}/$(date -u +%Y%m%d_%M%S)_$$.log"
export HISTCONTROL=ignoreboth
export HISTCONTROL=erasedups
export HISTIGNORE='&:bg:fg:clear:ls:ll:pwd:history:exit:make*:* --help:man:* pacman:cd'
export HISTTIMEFORMAT='%Y%m%d-%H:%M:%S'

histgrep () {
    grep -r "$@" ~/.history | cut -d ':' -f 2
}

export HISTSIZE=
export PROMPT_COMMAND='history -a; history -c; history -r; $PROMPT_COMMAND'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u@\h\[\033[00m\]:\w\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto --g'
alias la='ls -lAh --color=auto --g'
alias llg='ls -la | grep'
alias lld='ls -l --sort=time -r'
alias lldl='ls -l --color=always --sort=time | less -R'
alias lls='ls -lAh --color=always "$@" | less -R'
alias did="vim +'normal Go' +'r!date' ~/development/did/did.txt"
alias vim="nvim"
alias diff="diff --color=always"
alias ..="cd .."

PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
