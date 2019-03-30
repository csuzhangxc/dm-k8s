FROM alpine:3.9

RUN apk update && apk add --no-cache wget bash sed

ENV HOMEDIR /home/tidb

RUN mkdir -p $HOMEDIR $HOMEDIR/log $HOMEDIR/bin $HOMEDIR/conf

RUN cd /tmp && \
    wget http://download.pingcap.org/prometheus-2.2.1.linux-amd64.tar.gz && \
    tar xvzf prometheus-2.2.1.linux-amd64.tar.gz && \
    cd prometheus-2.2.1.linux-amd64 && \
    cp bin/prometheus $HOMEDIR/bin && \
    cd .. && \
    rm -rf prometheus-2.2.1.linux-amd64 prometheus-2.2.1.linux-amd64.tar.gz

COPY ./prometheus.yml $HOMEDIR/conf/prometheus.yml
RUN chmod a+x $HOMEDIR/bin/run-prometheus.sh

WORKDIR $HOMEDIR

EXPOSE 9090

ENTRYPOINT [ "./bin/run-prometheus.sh" ]
