# Use the official Node.js image
FROM node:19-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application's code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Run the application
CMD ["node", "app.js"]

