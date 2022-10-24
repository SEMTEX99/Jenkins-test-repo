FROM openjdk:8
EXPOSE 8080
ADD target/devopstest.jar devopstest.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]