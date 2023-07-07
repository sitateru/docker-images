FROM golang:1.20-alpine AS gcsfuse
RUN set -ex; \
    apk --no-cache add fuse git; \
    go install github.com/googlecloudplatform/gcsfuse@v1.0.0

FROM nginx:1.24.0-alpine
RUN set -ex; \
    apk --no-cache add fuse ca-certificates
COPY --from=gcsfuse /go/bin/gcsfuse /usr/local/bin
