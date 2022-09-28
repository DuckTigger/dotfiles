if [[${hostname} == mary.local]]; then
	alias vim=~/nvim-linux64/bin/nvim	
else
	# statements
	alias vim=nvim
	alias ls='lsd --group-dirs=first'
	alias ytop='ytop -p'
	alias btop=bpytop
	alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
	alias grep=batgrep
	alias less=bat
fi
alias ssh-myriad='TERM=xterm-256color ssh myriad'
alias ipdf='mupdf -I -r 216'
alias jupyterPort='echo Remember there are two versions: jupyterPortIn and jupyterPortExt'
alias jupyterPortIn='nohup ssh -N -f -L localhost:9999:localhost:9999 Home-PC'
alias jupyterPortExt='nohup ssh -N -f -L localhost:9999:localhost:9999 External-Home-PC'
