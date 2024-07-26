# Get Node.js 20 image from the Docker Hub
FROM node:20

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies in package.json
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Set the environment variable PORT to 8080
ENV PORT=8080

# Expose port 8080 to allow traffic to the container
EXPOSE 8080

# Run the application
CMD [ "node", "index.js" ]



# Run docker build - build a docker image as above with name richie/demoapp 
# docker build -t richie/demoapp:1.0 .

# Start container on Port 8080
# docker run -d -p 8080:8080 richie/demoapp:1.0