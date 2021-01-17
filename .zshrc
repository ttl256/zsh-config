source $ZDOTDIR/aliases

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=2000
SAVEHIST=2000
setopt share_history
setopt append_history
# .zsh_history is updated on every command
setopt inc_append_history
# Remove blank lines from history
setopt hist_reduce_blanks
# Ignore duplicates when searching
setopt hist_find_no_dups
# Don't store duplicate commands
setopt hist_ignore_dups
# Verify command when using history expansion like 'sudo !!'
setopt hist_verify

# Correction for mistyped commands
setopt correct
setopt correct_all

setopt no_case_glob

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
_comp_options+=(globdots)

autoload -Uz compinit
compinit

PROMPT="%F{green}%n%f%F{yellow}@%m%f in %F{cyan}%1d %f"$'\n'"%# "

setopt autocd
unsetopt beep
bindkey -v
