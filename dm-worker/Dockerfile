FROM alpine:3.9

RUN apk update && apk add --no-cache wget bash sed

ENV HOMEDIR /home/tidb

RUN mkdir -p $HOMEDIR $HOMEDIR/log $HOMEDIR/bin $HOMEDIR/conf

RUN cd /tmp && \
    wget http://download.pingcap.org/dm-latest-linux-amd64.tar.gz && \
    tar xvzf dm-latest-linux-amd64.tar.gz && \
    cd dm-latest-linux-amd64 && \
    cp bin/dm-worker $HOMEDIR/bin && \
    cp bin/dm-master $HOMEDIR/bin && \
    cp bin/dmctl $HOMEDIR/bin

COPY ./dm-worker.toml $HOMEDIR/conf/dm-worker.toml
COPY ./run-dm-worker.sh $HOMEDIR/bin/run-dm-worker.sh

WORKDIR $HOMEDIR

EXPOSE 8262

ENTRYPOINT [ "bin/run-dm-worker.sh" ]
