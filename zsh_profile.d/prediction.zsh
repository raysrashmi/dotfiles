setopt correct

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line


autoload -U edit-command-line
zle -N edit-command-line
bindkey -v
bindkey -M vicmd v edit-command-line

autoload predict-on
zle -N predict-on
zle -N predict-off

zstyle ':predict' verbose true
