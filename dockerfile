# Используем официальное минимальное изображение Go
FROM golang:1.23 AS builder

WORKDIR /app

COPY . .

RUN go mod tidy

RUN go build -o parcel_app .

FROM debian:stable-slim

WORKDIR /app

COPY --from=builder /app/parcel_app .

EXPOSE 8080

CMD ["./parcel_app"]
