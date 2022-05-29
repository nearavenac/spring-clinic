FROM openjdk:11

EXPOSE 8080

ADD build/libs/spring-petclinic-2.6.0.jar /app/app.jar

WORKDIR /app
CMD java -jar app.jar
