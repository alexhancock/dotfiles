source ~/dotfiles/zsh/zsh-z/zsh-z.plugin.zsh

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '*'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' formats '%b%u%c '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{75}%~%f %F{208}${vcs_info_msg_0_}%f$ '

export PATH="/Users/alexhancock/.local/bin:$PATH"
