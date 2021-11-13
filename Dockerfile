FROM node:14.18.1-alpine

LABEL maintainer="tomer.magera@gmail.com"
LABEL version="1.0"
##
#ENV NODE_ENV production
##
# Create app directory
WORKDIR /home/bootcamp-app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
#RUN npm ci --only=production

COPY --chown=node:node . .
#ADD . .

RUN echo `pwd`
#ARG configurtion=dev
#ARG port=8080


#ENV port=$port
USER node
EXPOSE 8080 
ENTRYPOINT ["npm","run","dev"]