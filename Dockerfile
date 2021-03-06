FROM golang:1.9.2 AS builder
LABEL maintainer="mcutalo@lyft.com"

WORKDIR /go/src/github.com/lyft/cni-eni/

RUN go get github.com/golang/dep && \
  go install github.com/golang/dep/cmd/dep && \
  go get -u gopkg.in/alecthomas/gometalinter.v1 && \
  gometalinter.v1 --install

COPY . /go/src/github.com/lyft/cni-eni/

RUN dep ensure && make build
