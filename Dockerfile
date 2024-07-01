# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven dependency descriptor
COPY pom.xml .

# Fetch the dependencies and package the application
RUN mvn dependency:go-offline

# Copy the application source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Use a smaller base image for the final application
FROM openjdk:11.0.13-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Specify the command to run on container startup
CMD ["java", "-jar", "app.jar"]
