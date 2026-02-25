
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ARG BRAND_CONFIG=generic
ENV BRAND=$BRAND_CONFIG
CMD ["node","app.js"]
