# Build
FROM maven:3.8.6-openjdk-17 AS build

WORKDIR /app

# Copy pom.xml and download dependency
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy code and build jar
COPY src ./src
RUN mvn package -DskipTests

# Run
FROM openjdk:17-jdk-slim

WORKDIR /app

# copy JAR-filen
COPY --from=build /app/target/imagegenerator-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

