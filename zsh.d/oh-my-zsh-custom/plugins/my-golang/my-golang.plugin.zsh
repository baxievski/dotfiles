if [[ $(type "go" &> /dev/null) ]]
then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi
