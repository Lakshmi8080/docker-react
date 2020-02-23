FROM node:alpine as builder
WORKDIR '/app'
#copying in root directory
COPY package.json .
# installing the dependencies
RUN npm install
# copying files from local machine to container
COPY . .
CMD [ "npm","run","start" ]

#This will create a new container
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
