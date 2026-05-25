FROM node:20-alpine

# Create app directory
WORKDIR /app

# Install dependencies based on package.json / package-lock.json
COPY package*.json ./
RUN npm ci --silent

# Copy app sources
COPY . .

EXPOSE 3001

CMD ["npm", "start"]