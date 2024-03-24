FROM gradle:latest AS build
WORKDIR /app
COPY . /app
RUN gradle build -x test

FROM azul/zulu-openjdk:17
WORKDIR /app
ENV PROFILE=test
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "/app/app.jar"]