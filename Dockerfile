# TPMT - The Peoples Miner Team
# Alcrymist Lynx Build v1
FROM ubuntu:20.04
# Set the TIPSY ID from customer above before running this dockerfile to build
ARG TIPSY_ID=be427dc173b4e890
# Set the TIPSY ID from customer above before running this dockerfile to build
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install wget && apt-get -f install
RUN cd /tmp
RUN wget https://github.com/getlynx/Lynx/releases/download/v0.16.3.12/lynx-arm32-wallet-0.16.3.12.tar.gz
RUN tar -zxvf lynx-arm32-wallet-0.16.3.12.tar.gz
RUN rm -rf lynx-arm32-wallet-0.16.3.12.tar.gz
RUN chmod 700 /lynx-arm32-wallet-0.16.3.12/*
RUN wget -q -P /tmp https://github.com/getlynx/LynxBootstrap/releases/download/v5.0-mainnet/chainstate.tar.gz
RUN wget -q -P /tmp https://github.com/getlynx/LynxBootstrap/releases/download/v5.0-mainnet/blocks.tar.gz
RUN mkdir -p /lynx
RUN tar -xzf /tmp/chainstate.tar.gz -C /lynx/
RUN tar -xzf /tmp/blocks.tar.gz -C /lynx/
RUN rm -rf /tmp/chainstate.tar.gz && rm -rf /tmp/blocks.tar.gz
RUN echo -e "debug=miner\nlisten=1\ndaemon=1\nlistenonion=0\nupnp=1\ndbcache=450\naddnode=node01.getlynx.io\naddnode=node02.getlynx.io\naddnode=node03.getlynx.io\naddnode=node04.getlynx.io\naddnode=node05.getlynx.io\n$TIPSY_ID" > /lynx/lynx.conf
RUN chmod +x+ /lynx-arm32-wallet-0.16.3.12/lynxd
ENTRYPOINT ["/lynx-arm32-wallet-0.16.3.12/lynxd"]
CMD ["-daemon=0 -conf=/lynx/lynx.conf -datadir=/lynx/ -debuglogfile=/lynx/debug.log"]
