export EDITOR=vim
export TERM=screen-256color
export HISTIGNORE='rm*:ls:ll:la:cd -:pwd:mci:fg'

reset() { echo -e "\e[0m"; }
bold() { echo -e "\e[1m${1}${reset}"; }

ansi() { echo -e "\e[38;5;${1}m${2}${reset}"; }
orange() { ansi 136 $1; }

parse_git_branch() {
   \git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/g"
}
git_branch_decorate() {
   echo $(parse_git_branch)
}
stash_info() {
	nb_stash=$(\git stash list 2> /dev/null | wc -l)
	if [[ $nb_stash -gt 0 ]]
	then
	   echo "/ "$nb_stash" stash"
	fi
}

PS1="[\u \w] $(stash_info)\n$(git_branch_decorate) $ "

maven_run () {
   echo mvn $@
   eval mvn $@
   echo mvn $@
}
vim_run () {
    vim_pid=`pgrep vim`   
    echo $vim_run
    if [[ ! -z "$vim_pid" ]]
    then
        job_number=$( jobs vim | grep -Po '^\[\K[0-9]*' )
        echo $job_number
        fg $job_number
    else
        vim $@
    fi
}

find_current_maven_project() {
   path=.
   while [[ "$path" != "/" ]]
   do
      find_result=$(find "$path" -maxdepth 1 -mindepth 1 -name pom.xml)
      if [[ -n $find_result ]]
      then
	 echo $(dirname $find_result)
	 break
      fi
      path="$(readlink -f $path/..)"
   done
}

source ~/.bash_aliases
if [[ -f ~/.bashrc.local ]]
then
   source ~/.bashrc.local 
fi
if [[ -f ~/.bash_aliases.local ]]
then
   source ~/.bash_aliases.local
fi
if [[ -f ~/.git-completion.sh ]]
then
   source ~/.git-completion.sh
fi
