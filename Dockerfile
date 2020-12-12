FROM golang:alpine AS builder

WORKDIR /usr/src/

COPY hello.go .
RUN go build -ldflags "-w" hello.go && rm -f hello.go


FROM scratch
WORKDIR /usr/src/

COPY --from=builder /usr/src/ .
ENTRYPOINT ["./hello"]
