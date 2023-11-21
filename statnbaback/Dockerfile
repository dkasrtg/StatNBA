FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
ARG PORT
ENV PORT=${PORT}
COPY --from=build /target/statnbaback-0.0.1-SNAPSHOT.jar statnbaback.jar
ENTRYPOINT ["java","-Dserver.port=${PORT}","-jar","statnbaback.jar"]