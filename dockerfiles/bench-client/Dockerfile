FROM golang:1.12.3-alpine3.9

RUN apk update && apk add --no-cache wget bash sed make git

ENV HOMEDIR /home/tidb
ENV CLIENT_VER v0.1.2

RUN mkdir -p $HOMEDIR $HOMEDIR/log $HOMEDIR/bin $HOMEDIR/conf

RUN cd /tmp && \
    git clone https://github.com/amyangfei/data-dam && \
    cd data-dam && \
    git checkout $CLIENT_VER && \
    make data-dam && \
    cp bin/data-dam $HOMEDIR/bin

COPY ./data-dam.toml $HOMEDIR/conf/data-dam.toml
COPY ./run-data-dam.sh $HOMEDIR/bin/run-data-dam.sh
RUN chmod a+x $HOMEDIR/bin/run-data-dam.sh

WORKDIR $HOMEDIR
