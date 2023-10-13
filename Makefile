all: build

#test:
#	go vet
#	go test -cover -coverprofile=coverage.out

build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build

clean:
	go clean


image:
	docker build -t drone-email -f Dockerfile  .

push:
	docker tag drone-email:latest docker.io/hyunghwan/drone-email:latest
	docker push docker.io/hyunghwan/drone-email:latest
