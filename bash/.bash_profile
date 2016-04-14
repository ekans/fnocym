currentDir=$(dirname $(readlink -e .bash_profile))

for module in $currentDir/module/*.bash
do
    source $module
done > module.log

if [ -d "$currentDir/module.local" ]
then
    for module in $currentDir/module.local/*.bash
    do
        source $module
    done > module.local.log
fi

