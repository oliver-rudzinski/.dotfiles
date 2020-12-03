### Shell Configuration



# PS1
export PS1="[\u@\H] \w >\n\\$ \[$(tput sgr0)\]"
PS1="\n$PS1"

# Remove zsh recommendation
export BASH_SILENCE_DEPRECATION_WARNING=1

# Enable directory-specific env vars
eval "$(direnv hook bash)"

### Python

# PyEnv Control
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Automatic (de)activation of virtual environments
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./.venv ]] ; then
        source ./.venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

### Node.js
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

### Misc

# DXC Technology AWS IAM Credentials
export $(echo $(grep AWS_ACCESS_KEY_ID ~/.aws/credentials))
export $(echo $(grep AWS_SECRET_ACCESS_KEY ~/.aws/credentials))

# DXC ACME Retail DataOps project work directory PYTHONPATH
export PYTHONPATH=$PYTHONPATH:~/Development/dataops/acme:~/Development/dataops/acme/stages/2_convert

### Directory shortcuts

# Enable cd to recognize variables
shopt -s cdable_vars
export icloud=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs

### Functional shortcuts

# Verbose ls
alias ls='ls -la'

# Python Virtual Environment
alias ve='python3 -m venv ./.venv'
alias va='source ./.venv/bin/activate'
alias mkvenv='ve && va'

# Remove to trash
alias tcn='mv --force -t $HOME/.Trash '
