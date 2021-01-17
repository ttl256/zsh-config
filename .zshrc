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

PROMPT="%F{green}%n%f%F{yellow}@%m%f in %F{cyan}%2d %f"$'\n'"%# "

setopt autocd
unsetopt beep
bindkey -v

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes and staged
# changes
zstyle ':vcs_info:*' unstagedstr ' unstaged'
zstyle ':vcs_info:*' stagedstr ' staged'
zstyle ':vcs_info:git:*' formats '(%b)%F{red}%u%f%F{cyan}%c%f'
zstyle ':vcs_info:git:*' actionformats '(%b)|%a%F{red}%u%f%F{cyan}%c%f'
zstyle ':vcs_info:*' enable git

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
