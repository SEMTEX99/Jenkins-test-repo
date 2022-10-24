FROM maven:3.6.3-jdk-8
EXPOSE 5000
RUN mkdir /app
COPY target/devops-integration.jar /app
COPY pom.xml /app
WORKDIR /app
ENTRYPOINT ["java","-jar","/app/devops-integration.jar"]