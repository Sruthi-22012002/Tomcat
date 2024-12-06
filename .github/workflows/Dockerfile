     FROM node:16 AS build

     WORKDIR /app

   # Copy local node_modules to avoid network dependency issues
     COPY package.json package-lock.json ./
    RUN npm config set timeout 600000 \
    && npm config set registry https://registry.npmmirror.com \
   && npm config set strict-ssl false

 COPY . .
 RUN npm install --offline || npm install --legacy-peer-deps --force

 RUN npm run build

 FROM nginx:alpine
 COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

    # Use OpenJDK 17 as the base image
     FROM openjdk:17-jdk-slim

     # Set the working directory
     WORKDIR /app

     # Copy the JAR file of the Spring Boot application (after building it locally)
     COPY target/springboot-backend-0.0.1-SNAPSHOT.jar app.jar

    # Expose the port that the backend service will listen to
     EXPOSE 8080

    # Run the Spring Boot application
    CMD ["java", "-jar", "app.jar"]
