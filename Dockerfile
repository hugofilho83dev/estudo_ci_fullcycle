FROM golang:1.24.2-alpine3.21

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o /app/main .

CMD [ "/app/main" ]