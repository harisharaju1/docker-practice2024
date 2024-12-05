FROM node:lts-alpine as builder
# 1st section

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# /app/build -> folder with build artifacts

# 2nd section
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html