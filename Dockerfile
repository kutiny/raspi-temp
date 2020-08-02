FROM node:alpine
ENTRYPOINT ["node", "server"]
WORKDIR /app
COPY package* .
RUN npm install
COPY . .