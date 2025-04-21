if [[ -x "$(command -v go)" ]]; 
then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi
