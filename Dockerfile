FROM java
COPY src /app
WORKDIR  /app
#RUN test install

FROM gradle:4.2.1-jdk8-alpine
#USER root                # This changes default user to root
#RUN chown -R gradle /app # This changes ownership of folder
#USER gradle              # This changes the user back to the default user "gradle"

RUN ./gradlew build --stacktrace

#RUN curl -L https://services.gradle.org/distributions/gradle-4.9-bin.zip -o gradle-4.9-bin.zip
#RUN apt-get install -y unzip
#RUN unzip gradle-4.9-bin.zip
#RUN echo 'export GRADLE_HOME=/app/gradle-4.9' >> $HOME/.bashrc
#RUN echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc
#RUN /bin/bash -c "source $HOME/.bashrc"
#RUN gradle build 
#RUN gradle test jar
 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
