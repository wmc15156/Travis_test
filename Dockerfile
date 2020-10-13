FROM node:alpine as bulider

WORKDIR /usr/src/app

COPY package.json .

RUN npm install 

COPY ./ ./

RUN npm run build

FROM nginx
COPY --from=bulider /usr/src/app/build /usr/share/nginx/html