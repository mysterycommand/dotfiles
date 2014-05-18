# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PATH=$PATH:$HOME/bin:$HOME/.dotfiles/bin
export PATH

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source ${HOME}/.dotfiles/colors.sh

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

source ${HOME}/.dotfiles/git-prompt.sh

export PS1='\n'$IYellow$Time12h$Cyan' \u '$Purple'\H'$IBlack$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
 echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
 if [ "$?" -eq "0" ]; then \
   # @4 - Clean repository - nothing to commit
   echo " '$Green'"$(__git_ps1 "(%s)"); \
 else \
   # @5 - Changes to working tree
   echo " '$IRed'"$(__git_ps1 "{%s}"); \
 fi) '$BYellow$PathShort$Color_Off' "; \
else \
 # @2 - Prompt when not in GIT repo
 echo " '$Yellow$PathShort$Color_Off' "; \
fi)\n\$'$Color_Off' '

# Shortcuts
alias resource='source ${HOME}/.bash_profile'
alias ll='ls -ltrG'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias +=pushd
alias clr='clear && $_'
alias reup='brew update && npm update -g && rvm get stable'

# # extremely powerful stuff follows, beware:
# # save bookmarks to directories by typing "save foo" which can be later accessed by "cd foo"

# if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
#         touch ~/.dirs
# fi

# alias show='cat ~/.dirs'
# save (){
#         command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ;
# }
# source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
# shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

# shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# # bash completion settings (actually, these are readline settings)
# bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
# bind "set bell-style none" # No bell, because it's damn annoying
# bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# # Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi

# alias g='grep -i'  #case insensitive grep
# alias f='find . -iname'
# alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
# alias top='top -o cpu'
# alias dev=/opt/init.d/dev
# alias svn-add-all='svn add `find | grep -vw "svn" | xargs`'
# alias ysgr='yinst set | grep -i '
export HISTFILE=${HOME}/.bash_history
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
shopt -s histappend

# export SVN_EDITOR=vi
# SSH_ENV=$HOME/.ssh/environment

# function startagent {
#      echo "Initialising new SSH agent..."
#      /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
#      echo succeeded
#      chmod 600 ${SSH_ENV}
#      . ${SSH_ENV} > /dev/null
#      /usr/bin/ssh-add;
# }

# # Source SSH settings, if applicable

# if [ -f "${SSH_ENV}" ]; then
#      . ${SSH_ENV} > /dev/null
#      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#          startagent;
#      }
# else
#      startagent;
# fi

# complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sed 's/^ssh //') $(cat ~/.ssh/known_hosts | cut -d, -f1) | sort -u)" ssh

