#base image
FROM node:alpine as angular-app

#setup service home dir
RUN mkdir -p /app-home

WORKDIR /app-home

#copy app dir extracted from the build image.  Assume build layer extracted the app
COPY app /app-home

RUN npm update
RUN npm install 

EXPOSE 8000
ENTRYPOINT npm start

