FROM gradle:4.9-jdk8-alpine
USER root
RUN mkdir -p /usr/src/app
COPY . /usr/src/app/
CMD ["/bin/sh", "/usr/src/app/startup.sh"] 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
