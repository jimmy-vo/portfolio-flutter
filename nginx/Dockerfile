
## BUIDER ##############################################################
FROM node:10 as builder

WORKDIR /src/

RUN apt-get update && \
    apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
    libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
    libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
    libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
    ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

COPY ./frontend/package*.json  /src/frontend/
COPY ./generator/package*.json  /src/generator/

WORKDIR /src/frontend/
RUN npm install --silent

WORKDIR /src/generator/
RUN npm install --silent

WORKDIR /src/
COPY ./frontend  /src/frontend/
COPY ./generator  /src/generator/
COPY ./data  /src/data/

ARG SUBDOMAIN

WORKDIR /src/generator/
RUN npm run gen-$SUBDOMAIN 

WORKDIR /src/frontend/
RUN npm run build-$SUBDOMAIN


## IMAGE ##############################################################
FROM nginx:1.14.1-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder  /src/frontend/dist/portfolio /usr/share/nginx/html
