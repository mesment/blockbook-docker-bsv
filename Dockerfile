FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update -y

RUN apt-get install -y curl sudo

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential
COPY dummyapp.js dummyapp.js

# Copy the pre-built .deb files
COPY debs/backend-bcashsv*.deb backend-bcashsv.deb
COPY debs/blockbook-bcashsv*.deb blockbook-bcashsv.deb

# Install the debs
RUN apt install -y ./backend-bcashsv.deb
RUN apt install -y ./blockbook-bcashsv.deb

# Copy the config file
COPY blockchain_cfg.json /opt/coins/blockbook/bcashsv/config/blockchaincfg.json

# Copy the startup script
copy launch.sh launch.sh

EXPOSE 9046 9146

VOLUME /opt/coins/data/bcashsv/blockbook/db
VOLUME /opt/coins/blockbook/bcashsv/logs

ENTRYPOINT /root/launch.sh

# Run this dummy app to keep the container running so that you can enter the
# container with `docker exec -it dev-bb bash` and debug the container from
# the inside.
#CMD node dummyapp.js
