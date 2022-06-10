FROM openjdk:19-slim

ENV BUILD_NUM="latest" \
    JAVA_ARGS="" \
    RAM="1G"
    

COPY launch.sh .
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /PaperMC

CMD ["sh", "./launch.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /PaperMC
