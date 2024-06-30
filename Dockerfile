
# Use OpenJDK 11 as the base image
FROM openjdk:11

# Set a label for the image maintainer
LABEL maintainer="Anish Gupta <anishkumars.gupta@gmail.com>"

# Copy the JAR file into the container at /usr/app/
COPY target/blogsapp.jar /usr/app/blogsapp.jar

# Set the working directory to /usr/app/
WORKDIR /usr/app/

# Expose port 9090 to the outside world
EXPOSE 9090

# Command to run when the container starts
CMD ["java", "-jar", "blogsapp.jar", "datasource=jdbc:mysql://mysqlcontainer:3306/blog_app?createDatabaseIfNotExist=true"]
