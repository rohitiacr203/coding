FROM gradle:4.9-jdk8-alpine
USER root
RUN mkdir -p /usr/src/app
COPY . /usr/src/app/
WORKDIR  /usr/src/app
RUN pwd && ls
RUN echo 'export GRADLE_HOME=/app/gradle-4.9' >> $HOME/.bashrc
RUN echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc
RUN gradle wrapper --gradle-version 4.9

RUN ./gradlew build --stacktrace
RUN pwd && ls
RUN ./gradlew test --stacktrace
 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
