FROM alpine:3.9

RUN apk update && apk add --no-cache wget bash sed

ENV HOMEDIR /home/tidb

RUN mkdir -p $HOMEDIR $HOMEDIR/log $HOMEDIR/bin $HOMEDIR/conf

RUN cd /tmp && \
    wget http://download.pingcap.org/grafana-4.6.3.linux-x64.tar.gz && \
    mkdir -p $HOMEDIR/opt
    tar xvzf grafana-4.6.3.linux-x64.tar.gz -C $HOMEDIR/opt && \
    mv $HOMEDIR/opt/grafana-4.6.3 $$HOMEDIR/opt/grafana
    rm -rf grafana-4.6.3.linux-x64.tar.gz

COPY ./grafana.ini $HOMEDIR/opt/grafana/conf/grafana.ini
RUN chmod a+x $HOMEDIR/bin/run-grafana.sh

WORKDIR $HOMEDIR

EXPOSE 3000

ENTRYPOINT [ "./bin/run-grafana.sh" ]
