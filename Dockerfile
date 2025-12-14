# Use Eclipse Temurin as it's the modern replacement for openjdk images
FROM eclipse-temurin:17-jdk-jammy

# Add the application's jar to the container
# Ensure this matches the name produced by your Maven build
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar

# Execute the jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Expose the port (matches your Jenkinsfile deploy stage)
EXPOSE 8089
