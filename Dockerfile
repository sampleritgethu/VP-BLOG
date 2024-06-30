FROM maven:3.8.5-openjdk-17 AS build
RUN echo 'Now started creating Image'
COPY target/blogsapp.jar  usr/app/blogsapp.jar
WORKDIR usr/app/
EXPOSE 9090
RUN echo 'Started Executing Command'
ENTRYPOINT ["java","-jar","blogsapp.jar","datasource=jdbc:mysql://mysqlcontainer:3306/blog_app?createDatabaseIfNotExist=true"]
CMD echo 'Container Started'
