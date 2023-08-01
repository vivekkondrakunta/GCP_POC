# # FROM node:18.12.1 as build
FROM node:18.12.1 as build
WORKDIR /usr/app
COPY . ./
# # RUN npm run build

FROM nginx:1.23.3-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/app/dist/* /
EXPOSE 4200
#CMD [ "node", "server.js"]
