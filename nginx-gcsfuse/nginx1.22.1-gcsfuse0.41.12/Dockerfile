FROM golang:1.19-alpine AS gcsfuse
RUN set -ex; \
    apk --no-cache add fuse git; \
    go install github.com/googlecloudplatform/gcsfuse@v0.41.12

FROM nginx:1.22.1-alpine
RUN set -ex; \
    apk --no-cache add fuse ca-certificates
COPY --from=gcsfuse /go/bin/gcsfuse /usr/local/bin
