FROM  vlatombe/java-build-tools as build
WORKDIR /usr/app
COPY . /usr/app
RUN mvn package

FROM openjdk:8-jdk-alpine
WORKDIR /usr/app
COPY --from=build /usr/app/target/* /usr/app
ENTRYPOINT ["java","-jar","helloworld-0.0.1.war"]
