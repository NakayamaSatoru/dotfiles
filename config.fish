set -x XDG_CONFIG_HOME $HOME/.config

set -x GOPATH /usr/local/go
set -x PYENV_ROOT $HOME/.pyenv
set -x JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
set -x PATH $PATH $PYENV_ROOT/bin $GOPATH/bin $JAVA_HOME/bin

eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)

alias vim='nvim'

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

function fish_user_key_bindings
  # bind \cr peco_select_history 
  bind \cx\k peco_kill 
  bind \cg ghq_fzf_repo 
end
