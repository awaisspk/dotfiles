if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.config/nvim/bin:$PATH"
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions'
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export ANDROID_HOME='/opt/android-sdk'
export CHROME_EXECUTABLE='/usr/bin/google-chrome-stable'

# Android SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export PATH="$PATH":"$HOME/.pub-cache/bin"
PATH=$ANDROID_SDK_ROOT/emulator:$PATH

# dart-sdk 
export PATH=$PATH:/opt/flutter/bin/cache/dart-sdk/bin
export PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH
export PATH=~/Coding/SHELL:"$PATH"
export PATH=/home/awais/semester/COAL/coal-repo/tools:$PATH

export PATH=/home/awais/anaconda3/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

export EDITOR='nvim'
export VISUAL=$EDITOR
export PAGER='less'
export UPDATE_INTERVAL=15

HISTSIZE=3000
SAVEHIST=$HISTSIZE
ZLE_RPROMPT_INDENT=0  
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey '^F' autosuggest-accept
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
autoload colors && colors
setopt histignorealldups sharehistory
eval "$(zoxide init --cmd j zsh)"
 
# #ALIASES
alias wifi="nmcli device wifi connect"
alias shortcuts="nvim ~/Documents/shortcuts.md"
alias kfont="kitty + list-fonts --psnames"
alias icat="kitty +kitten icat"
alias vsc="code-insiders ."
alias ...="cd ../.."
alias kconf="nvim ~/.config/kitty/kitty.conf"
alias md="mkdir"
alias coa="conda activate base"
alias cod="conda deactivate"
alias ydm="youtube-dl --extract-audio"
alias yd="youtube-dl"
alias zshconfig="nvim ~/.zshrc"
alias ..="cd .."
alias vi="nvim"
alias ls="lsd --group-dirs last"
alias l="ls -la --blocks inode,permission,user,size,date,name" 
alias ll="ls -l --blocks inode,permission,user,size,date,name"
alias l1="ls -1"
alias lr="lsd -R"
alias li="ls -i"
alias la="ls -a"
alias cat="bat"
alias lt="ls --tree --depth=1"
alias g="g++ -o"

# >>> conda initialize >>>

__conda_setup="$('/home/awais/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/awais/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/home/awais/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/home/awais/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup

# - - - - - - - - - - - - - - - - - - - -
# Zinit Configuration
# - - - - - - - - - - - - - - - - - - - -

__ZINIT="${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# THEME


zinit ice depth=1; zinit light romkatv/powerlevel10k
# PLUGINS    

# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# FZF
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf

# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf

# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# BAT
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light eth-p/bat-extras
alias rg=batgrep.sh
alias bd=batdiff.sh
alias man=batman.sh

# FORGIT
zinit ice wait lucid
zinit load 'wfxr/forgit'

# BIT
zinit ice lucid wait"0" as"program" from"gh-r" pick"bit"
zinit light "chriswalz/bit"

# pip autocompletion
eval "`pip completion --zsh`"
compctl -K _pip_completion pip3

# kitty terminal autocompletion
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

export PATH=$HOME/.config/nvcode/utils/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
