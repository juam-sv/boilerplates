FROM golang:1.18 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLE=1 GOOS=linux GOARCH=amd64 go build -o server

FROM scratch
COPY --from=builder /app/server /app/server
ENTRYPOINT [ "/app/server" ]
