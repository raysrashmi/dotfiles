export ALIASFILE=$HOME/checkouts/dotfiles/aliasrc

function path_alias {
  if  [ $2 ]
  then
    echo "alias $1='cd $2'" >> "$ALIASFILE"
  else
    echo "alias $1='cd `pwd`'" >> "$ALIASFILE"
  fi

  echo "created shortcut for $1"
}

function rm_alias {
  if [ $1 ]
  then
    sed -e "/$1/d" "$ALIASFILE" > aliasrc.tmp && mv aliasrc.tmp $ALIASFILE
  fi
}
