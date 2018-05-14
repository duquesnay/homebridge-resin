# base-image for node on any machine using a template variable,
# see more about dockerfile templates here: http://docs.resin.io/deployment/docker-templates/
# and about resin base images here: http://docs.resin.io/runtime/resin-base-images/
# Note the node:slim image doesn't have node-gyp
FROM resin/raspberrypi3-node:6-slim

# use apt-get if you need to install dependencies,
# for instance if you need ALSA sound utils, just uncomment the lines below.
#RUN apt-get update && apt-get install -yq \
#    alsa-utils libasound2-dev && \
#    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -yq \
    git make g++ nodejs python && \
#    libavahi-compat-libdnssd-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm install -g homebridge
RUN npm install -g homebridge-sonos

# Defines our working directory in container

WORKDIR /root/

COPY config.json .homebrew/config.json



# server.js will run when container starts up on the device
CMD ["homebridge"]
