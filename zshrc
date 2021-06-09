# The following lines were added by compinstall

zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd notify
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
#
# Copied .bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export MOZ_ENABLE_WAYLAND=1

source /home/andrew/.zkbd/alacritty-pc-linux-gnu
# [[ -n ${key[Backspace]} ]] && bindkey "${key [Backspace]}" backward-delete-char
# [[ -n ${key[Delete]} ]] && bindkey "${key [Delete]}" delete-char
# [[ -n ^${key[Left]} ]] && bindkey "^${key [Left]}" backward-word
# [[ -n ^${key[Right]} ]] && bindkey "^${key [Right]}" forward-word
# [[ -n ${key[Home]} ]] && bindkey "${key [Home]}" beginning-of-line 
# [[ -n ${key[End]} ]] && bindkey "${key [End]}" end-of-line
bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line 
bindkey "^[[F" end-of-line

export wmname LG3D
