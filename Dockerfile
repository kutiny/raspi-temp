FROM node:alpine
# RUN apk add raspberrypi
ENTRYPOINT ["node", "server"]
WORKDIR /app
COPY ./package*.json ./
RUN npm install --only=prod
COPY . .
RUN chmod -R 777 ./scripts/*
