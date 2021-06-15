export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/antigen.zsh

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

autoload -Uz ucl-vpn && ucl-vpn
autoload -Uz ucl-down

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

