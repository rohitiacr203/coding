FROM node:9.11.1
COPY src /app
WORKDIR  /app
EXPOSE 4201
RUN npm install
CMD npm start 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
