if ! hash mvn 2>/dev/null
then
    echo "Maven module not loaded"
    return
fi

maven_run () {
   echo mvn $@
   eval mvn $@
   echo mvn $@
}

alias mci='maven_run clean install'
alias mcc='maven_run clean compile'
alias mct='maven_run clean test'
alias mt='maven_run test'

