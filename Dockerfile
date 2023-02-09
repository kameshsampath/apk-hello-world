FROM docker.io/golang:1.20.0-alpine3.17 as builder

WORKDIR /apps

ENV CGO_ENABLED=0 

RUN go install github.com/kameshsampath/go-hello-world@v0.0.2

FROM gcr.io/distroless/static-debian11

COPY --from=builder /go/bin/go-hello-world /app

CMD ["/app"]