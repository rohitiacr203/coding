FROM java
COPY src /app
WORKDIR  /app
#RUN test install

FROM gradle:4.2.1-jdk8-alpine
RUN echo 'export GRADLE_HOME=/app/gradle-4.2.1' >> $HOME/.bashrc
RUN echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc
RUN gradle wrapper --gradle-version 4.2.1
RUN ./gradlew build --stacktrace
#RUN ./gradlew clean test --stacktrace
RUN gradle package
 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
