export ZSH="/home/andrew/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source /home/andrew/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle sudo
antigen bundle safe-paste
antigen bundle rsync
antigen bundle themes

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme candy 
antigen apply


fpath +=~/.zshfunctions
autoload -Uz ucl-vpn
autoload -Uz ucl-down
