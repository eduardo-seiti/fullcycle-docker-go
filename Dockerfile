FROM golang:alpine AS builder

WORKDIR /build
COPY . .
RUN go build -o main .
WORKDIR /dist
RUN cp /build/main .

FROM scratch
COPY --from=builder /dist/main /
ENTRYPOINT ["/main"]