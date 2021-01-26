FROM node:carbon
workdir /usr/src/app
copy package*.json ./
RUN npm install
copy . .
EXPOSE 8080
CMD npm start
