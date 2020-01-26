FROM alpine:

MAINTAINER albrecht-net

ENV INIT_MEM = 1G \
    MAX_MEM = 4G \
    SERVER_JAR = /minecraft_server.jar

RUN apk add --no-cache openjdk8-jre && \
    addgroup minecraft && adduser --ingroup minecraft -H -D minecraft

USER minecraft

EXPOSE 25565

WORKDIR /mc
VOLUME /mc

CMD exec java "-Xms$INIT_MEM" "-Xmx$MAX_MEM" -jar "$SERVER_JAR" nogui
