FROM node:14

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN apt update && apt -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb && rm -rf /var/lib/apt/lists/* /var/cache/apt/* 
RUN npm install

COPY . .

EXPOSE 8000

CMD [ "node", "app.js" ] 
