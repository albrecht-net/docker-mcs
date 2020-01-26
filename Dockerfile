FROM alpine:3.11.3

MAINTAINER albrecht-net

ENV INIT_MEM=1G \
    MAX_MEM=4G \
    SERVER_JAR=/minecraft_server.jar

RUN apk add --no-cache openjdk8-jre && \
    addgroup minecraft && adduser --ingroup minecraft -H -D minecraft && \
    mkdir /mc && chown -R minecraft:minecraft /mc

USER minecraft

EXPOSE 25565

VOLUME /mc
WORKDIR /mc

CMD exec java "-Xms$INIT_MEM" "-Xmx$MAX_MEM" -jar "$SERVER_JAR" nogui
