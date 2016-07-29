FROM alpine:edge
MAINTAINER Mike Patton <mpatton125@gmail.com>

RUN apk add --no-cache git libexif-dev go tor build-base && \
    export GOPATH=/usr/local && \
    go get github.com/s-rah/onionscan

CMD ["/usr/bin/tor","--user","tor","--DataDirectory","/var/run/tor"]
