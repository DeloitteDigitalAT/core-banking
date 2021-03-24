FROM node:12-alpine as build
WORKDIR /app

COPY package.json /app/package.json
RUN npm install --only=prod --silent
COPY . /app
RUN npm run build 

FROM nginx:1.17-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
