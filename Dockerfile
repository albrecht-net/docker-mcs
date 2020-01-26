FROM alpine:3.11.3

MAINTAINER albrecht-net

ENV USER=root \
    INIT_MEM=1G \
    MAX_MEM=4G \
    SERVER_JAR=minecraft_server.jar

RUN apk add --no-cache openjdk8-jre

USER $USER

EXPOSE 25565

WORKDIR /mc
VOLUME /mc

CMD exec java "-Xms$INIT_MEM" "-Xmx$MAX_MEM" -jar "$SERVER_JAR" nogui
