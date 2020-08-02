FROM node:alpine
RUN apk add raspberrypi
ENTRYPOINT ["node", "server"]
WORKDIR /app
COPY ./package* ./
RUN npm install --only=prod
COPY . .
