FROM rust:1.63-alpine AS builder

RUN apk add --no-cache musl-dev

WORKDIR /app

COPY . /app

RUN cargo install --path .

FROM alpine:3.16

COPY --from=builder /usr/local/cargo/bin/greeter /usr/local/bin/greeter

CMD ["greeter"]
