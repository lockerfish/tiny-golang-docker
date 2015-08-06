# tiny-golang-docker

##Steps

###1. clone this repo

git clone https://github.com/lockerfish/tiny-golang-docker.git

###2. cd to it

cd tiny-golang-docker

###3. install golang (if it is not installed already)

apt-get install golang
export GOPATH=/usr/share/go 

###4. install gorilla/mux (used for http routing)

go get github.com/gorilla/mux

###5. install tools/godep (to help organize dep)

go get github.com/tools/godep

export PATH=$PATH:/usr/share/go/bin

###6. save go dependencies

godep save github.com/gorilla/mux

###7. get golang docker image and compile code

docker run --rm -it -v "$GOPATH":/gopath -v "$(pwd)":/app -e "GOPATH=/gopath" -w /app golang:1.4.2 sh -c 'CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o hello'

###8. build new image

docker build -t lockerfish/go-hello-http .

###9. run it

docker run --rm -it -p 8080:8080 lockerfish/go-hello-http

