FROM node:20-alpine as builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build 

FROM node:20-alpine
COPY --from=builder /app ./
EXPOSE 3000
CMD ["npm", "start"]