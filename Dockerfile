FROM maven:3.8.8-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml ./ 
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean install -DskipTests

FROM eclipse-temurin:8-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/eurekaserver-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]