# Front docker image building file

FROM node:14.19.0
LABEL maintainer Raphael Tahar <raphael.tahar@snapshift.co>

ENV PATH /front/bin/$PATH

COPY package.json package-lock.json ./
WORKDIR /front

COPY . .

RUN npm install

CMD ["npm", "start"]
