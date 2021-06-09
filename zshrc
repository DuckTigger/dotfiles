export ZSH="/home/andrew/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle sudo
antigen bundle safe-paste
antigen bundle rsync
antigen bundle themes

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robyrussell
antigen apply
