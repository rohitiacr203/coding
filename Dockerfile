FROM gradle:4.9-jdk8-alpine
USER root
COPY startup.sh .
CMD ["/bin/sh", "startup.sh"] 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
