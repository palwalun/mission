FROM openjdk:19-ea-jdk-alpine3.1
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]