FROM node:carbon
workdir /usr/src/app
copy package*.json .
RUN nmp install
copy . .
EXPOSE 8080
CMD nmp start
