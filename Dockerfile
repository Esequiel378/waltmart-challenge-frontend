FROM node:12-alpine

# create destination directory
RUN mkdir -p /app
WORKDIR /app

# copy files for cache purpose
COPY ./frontend/package*.json ./

# install dependencies
RUN npm install

# copy the app, note .dockerignore
COPY ./frontend ./

# Host 0.0.0.0 is designated to tell Nuxt to resolve a host address,
# which is accessible to connections outside of the host machine.
ENV HOST 0.0.0.0

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN npm run build
