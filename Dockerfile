FROM node:4-onbuild

WORKDIR /usr/src/app

COPY package.json package.json

# Clean up the artifacts to reduce the image size.
RUN JOBS=MAX npm install --production --unsafe-perm && npm cache clean && rm -rf /tmp/*

# This will copy all files in our root to the working  directory in the container
COPY . ./

EXPOSE 8080

# server.js will run when container starts up on the device
CMD ["npm", "start"]
