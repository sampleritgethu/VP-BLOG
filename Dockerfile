FROM openjdk:11
RUN echo 'Now started creating Image'
MAINTAINER Anish Gupta<anishkumars.gupta@gmail.com>
COPY /absolute/path/to/target/blogsapp.jar  /app/blogsapp.jar
WORKDIR /app/
EXPOSE 9090
RUN echo 'Started Executing Command'
ENTRYPOINT ["java","-jar","blogsapp.jar","datasource=jdbc:mysql://mysqlcontainer:3306/blog_app?createDatabaseIfNotExist=true"]
CMD echo 'Container Started'
