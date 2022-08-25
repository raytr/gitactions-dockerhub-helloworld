FROM golang:1.17.7-alpine3.15 as builder

COPY ./ ./
RUN go mod download
RUN go build -a app .


FROM alpine:3.12

COPY --from=builder app /app/bin/app

WORKDIR /app/bin
CMD ["/app"]

