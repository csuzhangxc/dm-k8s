FROM alpine:3.9

ADD ./dm-worker /dm-worker
ADD ./dm-worker.toml /dm-worker.toml
ADD ./run-dm-worker.sh /run-dm-worker.sh

RUN chmod +x /dm-worker
RUN chmod +x /run-dm-worker.sh

WORKDIR /

EXPOSE 8262

CMD ["/run-dm-worker.sh"]
