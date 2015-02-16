export CURRENT_PROJECT_PATH=$HOME/.current-project

setopt auto_cd

function chpwd {
  echo $(pwd) >! $CURRENT_PROJECT_PATH
  ls
}

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}
