# source misc repos ##########################################################
function tbardwell__add_fpath {
    if [ -d "$1" ]; then
        fpath+="$1"
    fi
}

function tbardwell__source {
    if [ -f "$1" ]; then
        . "$1"
    fi
}

# different install paths possible
# tbardwell__add_fpath /usr/local/lib/node_modules/pure-prompt
# tbardwell__add_fpath /usr/lib/node_modules/pure-prompt
tbardwell__add_fpath /usr/share/zsh/site-functions


tbardwell__source /usr/share/autojump/autojump.sh
tbardwell__source ~/.config/zsh/scripts/highlighter.zsh

# pure (enabled)
autoload -U promptinit; promptinit
prompt pure
export PURE_PROMPT_SYMBOL="$"

# other plugins ###############################################################
