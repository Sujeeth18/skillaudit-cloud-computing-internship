# Use Node.js 20
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application source
COPY . .

# Build the Next.js application
RUN npm run build

# Expose Next.js port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]