#===============================
# stage 1 build stage
#===============================

FROM  maven:eclipse-temurin AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

#===============================
# stage 2 Rutime stage
#===============================

FROM eclipse-temurin:17.0.17_10-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar", "app.jar"]