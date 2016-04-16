if ! hash git 2>/dev/null
then
    echo "Git module not loaded"
    return
fi

# Retrieve root directory of conf
rootDir=$(readlink -f ~/.bash_profile)

if [[ -f $(dirname $rootDir)/module/externals/bash-git-prompt/gitprompt.sh ]]
then
    source $(dirname $rootDir)/module/externals/bash-git-prompt/gitprompt.sh
fi
if [[ -f $(dirname $rootDir)/module/externals/git-completion.sh ]]
then
    source $(dirname $rootDir)/module/externals/git-completion.sh
fi

alias g='\git'
# Map alias to git completion
# source: https://brbsix.github.io/2015/11/22/perform-tab-completion-for-aliases-in-bash/
_completion_loader git
complete -o bashdefault -o default -o nospace -F _git g
