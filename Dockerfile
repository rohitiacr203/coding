FROM java:8
WORKDIR /
ADD assesment.jar app.jar
EXPOSE 8080
