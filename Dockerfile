FROM java
COPY src /app
WORKDIR  /app
#RUN test install
RUN gradlew build
 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
