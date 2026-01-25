if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nvim
export VISUAL=nvim

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH="$JAVA_HOME/bin:$HOME/.local/bin:$PATH"

export LANG=en_US.UTF-8

HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  docker
  docker-compose
  sudo
  z
)

source $ZSH/oh-my-zsh.sh

alias cdz="z"
alias ts="tmux new -As"
alias tl='tmux list-session'
alias tk='tmux kill-session -t'

alias cat='batcat --theme="ansi" --paging=auto'

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias ls='eza --icons --color=auto --group-directories-first'
alias ll="eza -lha --color=auto  --git"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

# Remember connecting bluetooth usb for connecting headset
alias bluetooth-headset='pactl set-default-sink alsa_output.usb-Logitech_G_series_G435_Wireless_Gaming_Headset_202105190004-00.analog-stereo && echo "G435 selected as default sink"'
alias img="swayimg"

# FOR DOING FULL SCREEN VIDEOS
video() {
    DIR="$HOME/videos"
    index=0
    while [[ -f "$DIR/video$index.mp4" ]]; do
        ((index++))
    done

    FILE="$DIR/video$index.mp4"
    wf-recorder -f "$FILE"
    echo "Recording : $FILE"
}


alias monitor="swaymsg output eDP-1 disable"


[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


if [ -d "$HOME/.zshrc.d" ]; then
  for f in $HOME/.zshrc.d/*.zsh; do
    [ -r "$f" ] && source "$f"
  done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
