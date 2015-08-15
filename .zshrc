# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh/peco-select-history.zsh

export LANG=ja_JP.UTF-8

alias rb="sudo reboot"
alias sor='source ~/.zshrc'
alias c='cd'
alias v='vim'
alias ba='s ~/.zshrc'
alias l='ls -Glah'
alias i='ifconfig'
alias ansip='ansible-playbook -i hosts'
alias ansip1="cd /Users/jima/work/digital_ocean && ansible-playbook -i hosts /Users/jima/work/digital_ocean/provision/playbooks/setup.yml"

alias lso='lsof -i -n -P'
alias slso='sudo lsof -i -n -P'
alias rf='sudo rm -rf'
alias pk='pkill'

function ki(){
sudo kill -9 $1
}

alias cp="cp -R"
alias z="cd -"
alias q="cd .."
alias pc="tr -d '\n' |pbcopy"
alias f="nf start"
alias to="touch"
alias jl="jobs -l"
alias pwdc="pwd |tr -d '\n' |pbcopy"
alias bri="brew install"

function mk(){
mkdir -p $1 && cd $1
}

alias cx='chmod +x'

alias gii="git init"
alias gitc="s ~/.gitconfig"
alias gitigc="s /Users/jima/.gitignore"

alias gco="git checkout"
alias gcob="git checkout -b"
alias gst="git status"
alias gcm="git commit -am"
alias gbr="git branch"
alias gph="git push"
alias gpho="git push origin"
alias gphom="git push origin master"
alias gpl="git pull"
alias gcl="git clone"
alias gad="git add -A"
alias gmg="git merge"
alias gtr="git log1"
alias gtr2="git log2"
alias gdf="git diff --color-words"
alias grao="git remote add origin"


#git clone + cd
function gclc(){
    gcl $1
    tmp=`basename $1`
    fname="${tmp%.*}" #ファイル名のみ取り出し
    cd $fname
    s .
}



#add~push
function gg(){
    gagm $1
    gpho master
}


function gcma(){
    git commit --amend -m $1
}


function gagm(){
    gad && gcm $1
}


function grs(){
    git reset --soft HEAD$1
}


function grh(){
    git reset --hard HEAD$1
}


function jk(){ # TO DO: €s€=`jobs -l |gawk '{print $2}'|sed -n $1p`
echo $KILL_PID
kill -9 $KILL_PID
}

alias be='bundle exec'
alias bu="bundle update"
alias bi='bundle install --path vendor/bundle'

alias r="rails"
alias rr="rake routes"
alias rg="bundle exec rails generate"
alias rgs="bundle exec rails generate scaffold"
alias rgc="bundle exec rails generate controller"
alias rgmo="bundle exec rails generate model"
alias rgmi="bundle exec rails generate migration"

alias rd="bundle exec rails destroy"
alias rds="bundle exec rails destroy scaffold"
alias rdmo="bundle exec rails destroy model"
alias rdmi="bundle exec rails destroy migration"

alias rdm="bundle exec rake db:migrate"
alias rdr="bundle exec rake db:reset"
alias rds="bundle exec rake db:seed"
alias rdmr="bundle exec rake db:migrate:reset"

alias rgri="bundle exec rails g rspec:integration"

alias rgf="rails g factory_girl:model"


function rnew(){ #テンプレート作成
    rails new $1 --skip-bundle --skip-test-unit
    cd $1
    tmp1
    bi
}
alias ni="npm install"

alias vg='vagrant'
alias vgd='vagrant destroy -f'
alias vgu="vagrant up"
alias vgs="vg ssh"

alias ngc="s /usr/local/etc/nginx/"
alias ngcd="cd /usr/local/etc/nginx/"
alias ng="sudo nginx"
alias ngs="sudo nginx -s stop"
alias ngr="sudo nginx -s stop && sudo  nginx"

function psg(){ #open github from current directory
ps -ef | grep $1 | grep -v grep
}

alias rdc="redis-cli"
alias rds="redis-server"



