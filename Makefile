hello:
	echo "hello August"

build:
	go build -o bin/main main.go

run:
	go run main.go

all: hello build run
