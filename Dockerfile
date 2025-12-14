# Use an OpenJDK Runtime as a parent image
FROM openjdk:17-jdk-slim

# Add the application's jar to the container
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar

# Execute the jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Expose the port
EXPOSE 8089
