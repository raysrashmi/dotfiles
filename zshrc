export REMOTE_GEM_CACHE_PATH=$HOME/.remote-gem-cache
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew-search-cache

source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

current

export PGHOST=localhost

fpath=(/usr/local/share/zsh-completions $fpath)

export PATH=/usr/local/bin:$PATH:$HOME/bin

eval "$(rbenv init - zsh)"
