# 1) Build Angular (immagine leggera con Node)
FROM node:20-alpine AS builder
WORKDIR /app

# copia esplicita dei file di dipendenze
COPY package.json package-lock.json ./
RUN npm install

# copia il resto del codice e build
COPY . .
RUN npm run build -- --configuration production

# 2) Serve statici con Nginx
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder app/dist/hello /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]