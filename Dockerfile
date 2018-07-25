FROM java
COPY src /app
WORKDIR  /app
#RUN test install
RUN gradlew build

RUN curl -L https://services.gradle.org/distributions/gradle-4.9-bin.zip -o gradle-4.9-bin.zip
RUN apt-get install -y unzip
RUN unzip gradle-4.9-bin.zip
RUN echo 'ENV GRADLE_HOME=/app/gradle-4.9' >> $HOME/.bashrc
RUN echo 'ENV PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc
RUN /bin/bash -c "source $HOME/.bashrc"
RUN gradle build 
#RUN gradle test jar
 


#FROM java:8
#WORKDIR /
#ADD HelloWorld.jar HelloWorld.jar
#EXPOSE 8080
#CMD java - jar HelloWorld.jar
