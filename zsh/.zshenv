# Z Shell Environment Configuration

# shellcheck shell=bash disable=SC1091

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$HOME/.config/zsh"


# Vite+ bin (https://viteplus.dev)
export VITE_PLUS_HOME="$XDG_DATA_HOME/vite-plus"
. "$VITE_PLUS_HOME/env"
