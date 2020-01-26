FROM alpine:3.11.3

ENV USER=root \
    INIT_MEM=1G \
    MAX_MEM=4G \
    PORT=25565 \
    SERVER_JAR=minecraft_server.jar

RUN apk add --no-cache openjdk8-jre

USER $USER

EXPOSE $PORT

WORKDIR /mc
VOLUME /mc

ENTRYPOINT ["/usr/bin/java", "-Xms$INIT_MEM", "-Xmx$MAX_MEM", "-jar", "$SERVER_JAR", "nogui"]
# CMD exec java "-Xms$INIT_MEM" "-Xmx$MAX_MEM" -jar "$SERVER_JAR" nogui
