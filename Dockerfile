# build stage
FROM golang:1.14-alpine AS builder
RUN apk add --no-cache git
RUN go get -u github.com/YoRyan/smtp-translator

# final stage
FROM alpine:3.8.5
ENV PATH /go/bin:$PATH
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/smtp-translator .
ENTRYPOINT PUSHOVER_TOKEN=$PUSHOVER_TOKEN ./smtp-translator -hostname docker
