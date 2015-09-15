FROM scratch
MAINTAINER Hendrix Tavarez "hendrix@lockerfish.com"
EXPOSE 8080
WORKDIR /app
# copy binary into image
COPY hello /app/
ENTRYPOINT ["./hello"]
