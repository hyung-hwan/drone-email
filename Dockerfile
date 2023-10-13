FROM golang:1.20-alpine as builder

WORKDIR /go/src/drone-email
COPY . .

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build

FROM alpine:3.15
RUN apk add --no-cache ca-certificates tzdata
##FROM scratch

COPY --from=builder /go/src/drone-email/drone-email /bin/drone-email
##COPY --from=builder /go/src/drone-email/drone-email /drone-email
ENTRYPOINT ["/bin/drone-email"]
