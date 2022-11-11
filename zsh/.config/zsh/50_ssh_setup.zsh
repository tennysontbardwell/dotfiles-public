# Preferred editor for local and remote sessions
export EDITOR="nvim"
export VISUAL="nvim"
# export VISUAL="$HOME/.config/zsh/scripts/emc.sh"

# Go
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin

# Ruby
if [ -d $HOME/.gem/ruby ]; then
    _ruby_dir=$(ls $HOME/.gem/ruby | tail -n 1)
    if [ ! -z $_ruby_dir ]; then
        export PATH=$PATH:$HOME/.gem/ruby/$_ruby_dir/bin
    fi
fi

# ==== PROMPT ====

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=") "

# misc ########################################################################
zstyle ':completion:*' menu select

SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=$HOME/.zsh_history
