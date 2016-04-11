GOROOT=$HOME/bin/go
GOPATH=$HOME/gowork
if [ ! -d $GOROOT ] || [ ! -d $GOPATH ]
then
    echo "Go bash module not loaded"
    return
fi

export GOROOT=$GOROOT
export GOPATH=$GOPATH

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

