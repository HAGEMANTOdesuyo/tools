alias ls='ls -FG'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias grep='grep --color=auto'
export PATH=\
~/bin\
:/Applications/Docker.app/Contents/Resources/bin/docker-compose-v1\
:/Applications/Docker.app/Contents/Resources/bin\
:$PATH
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1='%n@%m:%~
%# '
autoload -U compinit
compinit
setopt auto_menu
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
