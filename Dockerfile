FROM node:alpine
ENTRYPOINT ["node", "server"]
WORKDIR /app
COPY ./package*.json ./
RUN npm install --only=prod
COPY . .
