# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Import colourscheme from wal
# (cat ~/.cache/wal/sequences &)

DISABLE_LS_COLORS='true'
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
antigen bundle darvid/zsh-poetry

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k
antigen apply

autoload -Uz ucl-vpn && ucl-vpn
autoload -Uz ucl-down


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:$HOME/.local/bin"
export PROMPT_COMMAND=`printf "\e]112\a"`
export PATH=$PATH:/home/andrew/.spicetify
export PATH=$PATH:/Users/andrew/.spicetify
export PATH=$PATH:/Users/andrewpatterson/.spicetify
export PATH=$PATH:/opt/homebrew/anaconda3/bin
export PATH="$PATH:$HOME/Documents/Riverlane/psi4/objdir/stage/bin"
export PSI_SCRATCH="$HOME/.psi4_scratch"
export PYTHONPATH="$HOME/Documents/Riverlane/psi4/objdir/stage/lib/:$PYTHONPATH"  # psi4 pymodule
export GPAW_SETUP_PATH="$HOME/.GPAW_DATA/gpaw-setups-0.9.20000"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andrewpatterson/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andrewpatterson/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/andrewpatterson/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$PATH":/Users/andrewpatterson/miniforge3/bin
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
