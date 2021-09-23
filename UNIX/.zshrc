# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/rafal.pienkowski/.oh-my-zsh"

DEFAULT_USER="$USER"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_TMUX_AUTOSTART='true'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

plugins=(
  brew
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  osx
  sdkman
  tmux
  kubectl
)


source $ZSH/oh-my-zsh.sh

#Include Z
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

#alias cat="bat"
alias ls="exa -la"
alias cat="bat"
alias dc="docker-compose"
alias t="tmux -CC"
alias tmux="tmux -CC"
alias v="vim"
alias c="code"
alias dc="docker-compose"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

complete -F __start_kubectl k
