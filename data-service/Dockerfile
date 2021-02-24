FROM node:10-alpine

# Create app directory
WORKDIR /data-service

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm install

# Bundle app source
COPY . .

CMD [ "npm", "start" ]
