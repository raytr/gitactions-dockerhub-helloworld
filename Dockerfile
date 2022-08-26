FROM golang:1.17.7-alpine3.15 as builder

WORKDIR /app

COPY ./ ./

RUN go mod download
RUN go build -o /helloworld .






FROM alpine:3.12

COPY --from=builder /helloworld        /app/bin/helloworld

WORKDIR /app/bin

CMD ["./helloworld"]

