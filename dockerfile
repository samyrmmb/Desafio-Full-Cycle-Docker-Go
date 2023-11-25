FROM golang:alpine AS build
ENV GO111MODULE=off
WORKDIR /app
COPY . .
#RUN go build -o main .
RUN go build -ldflags "-s -w" -o main .


FROM hello-world:linux
WORKDIR /app
COPY --from=build /app/main .
CMD ["./main"]

#RUN apk del .build-dependencies && \
#    rm -rf /var/cache/apk/*

#RUN apk del busybox

#ENV PATH=$PATH:/app

#RUN rm -rf /var/cache/apk/*

