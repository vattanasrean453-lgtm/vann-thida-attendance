FROM node:22-alpine

WORKDIR /app

# Install build dependencies if needed
RUN apk add --no-cache tzdata
ENV TZ=Asia/Phnom_Penh

COPY package*.json ./
RUN npm ci --only=production

COPY . .

# Expose Web App Port
EXPOSE 3000

ENV PORT=3000
ENV NODE_ENV=production

CMD ["npm", "start"]
