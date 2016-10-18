FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="kuwrqi9" \
    STACKSMITH_STACK_NAME="Node.js 6.8.1 on Debian" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install node-6.8.1-0 --checksum 75317cb103f6a50aee67e492aa80af443f9919cf1bd33959fcd9e4ddda634221

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

# ExpressJS template
COPY . /app
WORKDIR /app

RUN npm install

EXPOSE 3000
CMD ["npm", "start"]
