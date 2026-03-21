# Z Shell Configuration

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export CODEX_HOME="$XDG_CACHE_HOME/codex"
export ELAN_HOME="$XDG_DATA_HOME/elan"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

mkdir -p "$XDG_CACHE_HOME/zsh" "$XDG_STATE_HOME/zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Ensure unique entries in the path array.
typeset -U path PATH
path=(
	"/opt/homebrew/opt/uutils-coreutils/libexec/uubin"
	"/opt/homebrew/opt/llvm/bin"
	"$CARGO_HOME/bin"
	"$ELAN_HOME/bin"
	"$HOME/.local/bin"
	$path
)
export PATH

# Defined before syntax highlighting to ensure proper colouration.
alias cat='bat'
alias ls='eza'
alias du='dust'

if [[ "${TERM:-}" != "dumb" ]]; then
	eval "$(starship init zsh)"
fi

eval "$(zoxide init zsh --cmd cdz)"

# Add Homebrew completions to fpath before compinit so they are discovered correctly.
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

[[ -f /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
	&& source /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# This plugin must be sourced last to function correctly.
[[ -f /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
	&& source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

