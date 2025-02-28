# Use AdoptOpenJDK 11 as the base image
FROM adoptopenjdk/openjdk11

# Expose the application port
EXPOSE 8080

# Define application home directory
ENV APP_HOME /usr/src/app

# Create the app directory to avoid issues
RUN mkdir -p $APP_HOME

# Define JAR file argument (allows dynamic JAR selection)
ARG JAR_FILE=target/*.jar

# Copy JAR file to application directory
COPY ${JAR_FILE} $APP_HOME/app.jar

# Set working directory
WORKDIR $APP_HOME

# Command to run the application
CMD ["java", "-jar", "app.jar"]


