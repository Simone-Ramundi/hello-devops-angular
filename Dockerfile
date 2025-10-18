# 1) Build Angular (immagine leggera con Node)
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build -- --configuration production

# 2) Serve statici con Nginx
FROM nginx:alpine
COPY --from=builder /app/dist/hello /usr/share/nginx/html
# opzionale: custom nginx.conf per SPA
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]