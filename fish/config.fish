
#####################################################
# GLOBAL VARIABLES
#####################################################
# set -gx TERM "xterm-256color"
# set -gx TERM "screen-256color" --
set -gx TERM tmux-256color
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx PYENV_ROOT "$HOME/.pyenv"
# set -gx DOCKER_HOST "unix:///run/docker.sock"
set -gx DOCKER_CONFIG "$HOME/.docker"

set -x PAGER "bat"
set -x BAT_PAGER "less -RF"
set -gx LESS "--mouse --wheel-lines=3"
set -gx VISUAL nvim
set -gx EDITOR nvim
# set -gx BROWSER /Applications/Firefox.app/Contents/MacOS/firefox
set -gx GPG_TTY (tty)
set -gx KUBE_EDITOR nvim

### SET MANPAGER
### Uncomment only one of these!
set -x MANPAGER "nvim +Man!"
# set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
# set -x MANPAGER "less"

set -gx AWS_PROFILE default
set -gx AWS_DEFAULT_PROFILE default
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/ruby@3.1/lib/pkgconfig"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx NNN_OPENER "$XDG_CONFIG_HOME/nnn/plugins/nuke"
set -gx NNN_FIFO '/tmp/nnn.fifo'

set -gx LANG "en_US.UTF-8"
set -gx ANDROID_HOME $HOME/cmdline-tools/bin

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#####################################################
# PATH
#####################################################
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.npm/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/opt/ruby@3.1/bin
fish_add_path /opt/homebrew/opt/libpq/bin
fish_add_path /opt/homebrew/opt/ffmpeg@5/bin
fish_add_path $HOME/.config/emacs/bin
fish_add_path $HOME/.rd/bin
fish_add_path /usr/local/bin
fish_add_path $GOBIN
fish_add_path /opt/homebrew/opt/lsof/bin
fish_add_path /Users/aaron.arredondo/.local/nvim-macos-arm64/bin
fish_add_path /sbin/
fish_add_path $HOME/cmdline-tools/bin

#####################################################
# ALIAS
#####################################################
# alias ls='lsd'
alias ls='eza --group-directories-first --icons'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='lsd --tree'
# alias ls='eza -al --color=always --group-directories-first' # my preferred listing
# alias la='eza -a --icons --color=always --group-directories-first' # all files and dirs
# alias ll='eza -l --color=always --group-directories-first' # long format
# alias lt='eza -aT --color=always --group-directories-first' # tree listing
# alias lh='eza -a | egrep "^\."'
# alias l.='eza -al --color=always --group-directories-first ../' # ls on the PARENT directory
# alias l..='eza -al --color=always --group-directories-first ../../' # ls on directory 2 levels up
# alias l...='eza -al --color=always --group-directories-first ../../../' # ls on directory 3 levels up


alias today="date +'%Y_%m_%d'"
alias clip="pbcopy"
alias notes='cd ~/.notes && nvim .'
alias cat='bat -pp --theme=neofusion'
alias less='bat --theme=neofusion --plain'

alias qr="pbpaste | qrencode -o ~/Desktop/qrcode.png && open ~/Desktop/qrcode.png"
alias ld="lazydocker"
alias lg="lazygit"
alias gj="git jump"

alias emacs="emacsclient -c -a 'emacs'"
alias temacs="emacsclient -t -a ''"
alias em='/opt/homebrew/bin/emacs -nw'
alias pyink="~/.pyenv/versions/py3nvim/bin/pyink"
alias rem="killall emacs || killall Emacs-arm64-11 || echo 'Emacs server not running'; /opt/homebrew/bin/emacs --daemon"

alias cb="git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy"
alias dev="git checkout development && git pull origin development"
alias mybranches="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | rg Arredondo | rg remote"
alias doohanbranches="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | rg Doohan | rg remote"

alias gogh='bash -c "$(curl -sLo- https://git.io/vQgMr)"'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias nf='neofetch'
alias ff='fastfetch'
alias pf='pfetch'
alias shark='cd ~/Projects/repos/display3d/ && display3d blahaj.obj -t 0,0,5.5 --shader none --fps 10'
alias tf='terraform'
alias ghostty_animation='~/Projects/repos/ghostty-animation-command/target/debug/ghostty_animation'

# FZF neofusion theme
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#031B26,bg:#06101e,spinner:#fd5e3a,hl:#e2d9c5 \
--color=fg:#08435E,header:#e2d9c5,info:#35b5ff,pointer:#fa7a61 \
--color=marker:#fd5e3a,fg+:#66def9,prompt:#35b5ff,hl+:#fd5e3a"

set -Ux FZF_CTRL_R_OPTS "\
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'\
  --color header:italic\
  --header 'Press CTRL-Y to copy command into clipboard'"

#####################################################
# FUNCTIONS
#####################################################
function cls
    clear
    # if set -q TMUX
    #    exec tmux clear-history
    # end
    tmux clear-history
end

function geek-tmux-session
    if not set -q TMUX
        exec tmux new-session -ADs geek-1
    end
end

function env_export --argument filename
    export (grep "^[^#]" $filename | xargs -L 1)
end

function pytest_moti
  env_export local-overrides.env
  . .venv/bin/activate.fish
  make test
end

function pyenv_init
  pyenv init - | source
end

function poetry_env
    jq \
        --null-input \
        --arg venv "$(basename $(poetry env info -p))" \
        --arg venvPath "$(dirname $(poetry env info -p))" \
        '{ "venv": $venv, "venvPath": $venvPath }' >pyrightconfig.json
end

function git_last_changes
    # git diff $(git branch --show-current)@{1} $(git branch --show-current)
    git diff $(__git.current_branch)@{1} $(__git.current_branch)
end

function git_fix_date
    # To fix the date on squashed commits to be today
    GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"
end

function file_create --argument filename
    mkdir -p "$(dirname "$filename")" && touch "$filename"
end

function git_rm_untraked
    git ls-files --others --exclude-standard | fzf -m | xargs rm
    echo "removed untracked files from project"
end

function urlencode --argument inputstr
  python3 -c "import urllib.parse; print(urllib.parse.quote('$inputstr'))"
end

function __fzf_history
  set -l chosen (history | fzf --tac --reverse --prompt='Command History: ' --tmux center)
  if test -n "$chosen"
    commandline -r "$chosen"
  end
end

function __fzf_tldr
  fzf --bind 'enter:become(vim {})'
  fzf --style full \
    --preview 'tldr {}' --bind 'focus:transform-header:file --brief {}'
end

bind \cb '__fzf_history'  # Ctrl+R to trigger history fzf

set -g FZF_CTRL_R_COMMAND __fzf_history

# if command -sq ngrok > /dev/null
#     eval (ngrok completion)
# end

#####################################################
# PROMPT
#####################################################
if status is-interactive
    function fish_greeting; end

    eval (/opt/homebrew/bin/brew shellenv)

    # if not set -q TMUX
    #     exec tmux new-session -ADs geek-1
    # end

    # Commands to run in interactive sessions can go here
    # source ~/.env
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]
        . "$HOME/google-cloud-sdk/path.fish.inc"
    end

    source ~/.asdf/asdf.fish
    # pyenv init - | source
    fzf --fish | source
    starship init fish | source
end
