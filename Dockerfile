# Use the official Node.js image as the base image
FROM oven/bun

# Set the working directory
WORKDIR /app

# Copy the package.json into the container
COPY package.json package.json

# Install dependencies using bun
RUN bun install

# Copy the rest of the Svelte app into the container
COPY . .

# Build the Svelte app
RUN bun run build

# Expose port 3000 so that the container can be accessed from the host
EXPOSE 3000
ENTRYPOINT ["bun", "./build"]