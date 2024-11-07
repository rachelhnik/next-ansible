FROM node:20-alpine

LABEL maintainer="Rachel <shwehnit14@gmail.com>"
LABEL version="1.0"
LABEL description="This is a dockerfile."

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN  npm run build

EXPOSE 3000

CMD [ "npm", "start" ]

#instructions
#docker build -t nextapp .
#docker run -d -p 3000:3000 --restart=always --name nextapp nextapp

