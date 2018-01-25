FROM ubuntu:16.04

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install build-essential curl -y

ENV BITCOIN_VERSION=0.15.1
ENV BITCOIN_FILE_NAME=bitcoin-$BITCOIN_VERSION-x86_64-linux-gnu.tar.gz
ENV BITCOIN_URL=https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/$BITCOIN_FILE_NAME

RUN curl $BITCOIN_URL -o $BITCOIN_FILE_NAME

ADD verify.sh /verify.sh
RUN chmod +x /verify.sh
RUN /verify.sh

RUN tar zxvf $BITCOIN_FILE_NAME
RUN cp bitcoin-$BITCOIN_VERSION/bin/* /usr/local/bin

ADD start /start
RUN chmod +x /start

EXPOSE 8332 8333 18332 18333

ENTRYPOINT ["/start"]
