#temporary build container
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run container nginx
    #will automatically take the build container instance
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

