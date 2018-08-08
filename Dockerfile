FROM java:8
WORKDIR /
ADD build/libs/assesment-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

