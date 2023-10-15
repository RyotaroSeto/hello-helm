FROM golang:1.21.3-bookworm AS builder

ENV ROOT /app
ENV GOOS linux
ENV GOARCH amd64

WORKDIR ${ROOT}

COPY . ${ROOT}
RUN go mod download && go build -o ${ROOT}/server

# -------------------------------

FROM debian:12.1-slim

ENV ROOT /app
ENV GO_ENV production
COPY --chown=nobody:nobody --from=builder ${ROOT}/server /usr/local/bin

EXPOSE 8080
CMD ["server"]
