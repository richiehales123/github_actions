# Stage 1: Build stage
# Use Node.js 20 as the base image for building the application.
FROM node:20 AS build

# Set the working directory in the container to /app.
WORKDIR /app

# Copy package.json and package-lock.json to the working directory.
# This allows npm to install the dependencies.
COPY package*.json ./

# Install the dependencies specified in package.json.
# This step installs all required npm packages.
RUN npm install

# Copy the rest of the application code to the working directory.
# This includes all source files and configuration files.
COPY . .

# Stage 2: Production stage
# Use a smaller Node.js image for the final production image.
# This helps reduce the size of the final image and limits potential attack surface.
FROM node:20-slim

# Set the working directory in the container to /app.
WORKDIR /app

# Copy the application code and installed dependencies from the build stage.
# This avoids including development tools and unnecessary files in the final image.
COPY --from=build /app /app

# Create a non-root user and group to run the application.
# Running as a non-root user improves security by reducing privileges.
RUN groupadd -r app && useradd -r -g app app
USER app

# Set the environment variable PORT to 8080.
# This configures the application to listen on port 8080.
ENV PORT=8080

# Expose port 8080 to allow traffic to the container.
# This makes the application accessible on port 8080.
EXPOSE 8080

# Run the application using the node command.
# This starts the application with index.js as the entry point.
CMD [ "node", "index.js" ]




# Run docker build - build a docker image as above with name richie/demoapp 
# docker build -t richie/demoapp:1.0 .

# Start container on Port 8080
# docker run -d -p 8080:8080 richie/demoapp:1.0