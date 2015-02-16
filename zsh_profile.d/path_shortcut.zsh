export CURRENT_PROJECT_PATH=$HOME/.current-project
export ALIASFILE=$HOME/checkouts/dotfiles/aliasrc

function short_path {
  if  [ $2 ]
  then
    echo "path is $2"
    echo "$ALIASFILE"
    echo "alias $1='cd $2'" >> "$ALIASFILE"

  elif [[ -f $CURRENT_PROJECT_PATH ]]
  then
    echo "curretn path"
    alias $1="cd $CURRENT_PROJECT_PATH"
  else
    echo "You are not allowed to create this"
  fi

  echo "created shortcut for $1"
}

current() {
  echof "rayssssssss"
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}
