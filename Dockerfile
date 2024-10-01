#BUILDER

FROM node:latest AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#RUNNER
FROM nginx
EXPOSE 80

COPY --from=build /app/dist /usr/share/nginx/html
