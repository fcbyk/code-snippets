FROM node:14-alpine

LABEL maintainer="yourname@example.com"
ENV APP_HOME /usr/src/app
WORKDIR $APP_HOME

COPY package*.json ./
COPY . .

RUN npm i

EXPOSE 8080

CMD ["node", "app.js"]