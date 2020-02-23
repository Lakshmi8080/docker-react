FROM node:alpine as builder
WORKDIR '/app'
#copying in root directory
COPY package.json .
# installing the dependencies
RUN npm install
# copying files from local machine to container
COPY . .
RUN npm run build

#This will create a new container
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
