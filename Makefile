hello:
	echo "hello April"

build:
	GO111MODULE=on go build -o bin/main main.go

run:
	go run main.go

all: hello build run
