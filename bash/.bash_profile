currentDir=$(dirname $(readlink -e .bash_profile))

for module in $currentDir/module/*.bash
do
    source $module
done

if [ -d "$currentDir/module.local" ]
then
    for module in $currentDir/module.local/*.bash
    do
        source $module
    done
fi

