FROM golang:1.20.5-alpine3.17


RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

LABEL maintainer="Ahmed Gomaa <gomaaa447@gmail.com>"

WORKDIR /app

COPY ./go.mod go.sum ./
COPY . .

RUN go build -o main  

EXPOSE 9090

CMD ["./main"]