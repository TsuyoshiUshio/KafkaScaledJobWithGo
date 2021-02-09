FROM golang:1.15.8-alpine3.13 as builder

RUN mkdir /workplace
WORKDIR /workplace

COPY . .

RUN go build -o main main.go

FROM alpine:3.13 
COPY --from=builder /workplace/main /main

CMD ["/main"]
