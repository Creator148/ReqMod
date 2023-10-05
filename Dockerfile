FROM openjdk:8
ADD target/spring-1.0-SNAPSHOT.war app.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.war"]