txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.2/bin
export PATH="$MAMP_PHP:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH

alias g='git'
alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias proj='cd /Projects/Bendyworks/'
alias hosts='st /private/etc/hosts'
alias bp='vi ~/.bash_profile'
alias httpdconf='st /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf'
alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias simple='python -m SimpleHTTPServer 8000'
alias dev='cd /Users/Mic/Dropbox/Mic/dev'
alias localhost='cd /Users/Mic/localhost/'
alias server='ruby -run -e httpd . -p 9090'
alias amfam="cd Dropbox/American\ Family/Captivate\ Modules\ Production/apps"
alias elastic-up='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'
alias mongo-up='mongod'
alias ls='/bin/ls -FG'
alias la='ls -a'
alias grep='grep --color=auto'
alias reload='source ~/.bash_profile'
alias v="vagrant"
alias vu="v up"
alias vr="v reload"
alias vp="v provision"
alias vd="v destroy"
alias vup="vu --provision"
alias vrp="vr --provision"
alias mamp="open /Applications/MAMP/MAMP.app"
alias gr="grunt"
source ~/.git-completion.bash

#git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PS1="\[${txtcyn}\]\W\[${txtylw}\] >\[${txtrst}\] "
