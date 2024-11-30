
## Dockerize the file
### 1.  react-hooks-frontend
Create a Dockerfile file inside /ems-ops-phase-0/react-hooks-frontend/ folder
    ```bash
    Sudo nano Dockerfile
    ```
  paste this : 
   ```bash
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
 ```
### 2.  springboot-backend
Create a Dockerfile file inside /ems-ops-phase-0/springboot-backend/ folder
    ```bash
    Sudo nano Dockerfile
    ```
  paste this : 
   ```bash
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
 ```
### 3. docker-compose.yml
create a docker-compose.yml in /ems-ops-pahse-0/ folder
```bash
    Sudo nano docker-compose.yml
    ```
```bash
    version: '3.8'

services:
  # React Frontend Service
  frontend:
    build:
      context: ./react-hooks-frontend
      dockerfile: Dockerfile
    ports:
      - "3002:80"  # React will be served on port 3000
    networks:
      - frontend_network
    depends_on:
      - backend

  # Spring Boot Backend Service
  backend:
    build:
      context: ./springboot-backend
      dockerfile: Dockerfile
    ports:
      - "8081:8080"  # Spring Boot app on port 8080
    environment:
      SPRING_DATASOURCE_URL: jdbc:mysql://database:3306/employees
      SPRING_DATASOURCE_USERNAME: root
      SPRING_DATASOURCE_PASSWORD: 0612
    depends_on:
      - database
    networks:
      - frontend_network
      - backend_network

  # MySQL Database Service
  database:
    image: mysql:8
    environment:
      MYSQL_DATABASE: employees
      MYSQL_ROOT_PASSWORD: 0612
    ports:
      - "3307:3306"  # Database accessible on port 3306 (optional)
    volumes:
      - mysql-data:/var/lib/mysql  # Persistent volume for database
    networks:
      - backend_network

# Network Configuration to Isolate Services
networks:
  frontend_network:
    driver: bridge
  backend_network:
    driver: bridge

# Persistent Volume for MySQL Database
volumes:
  mysql-data:
    driver: local
```
### To build the compose file
  ```bash
  docker-compose build
```
### To compose the application
 ```bash
  docker-compose up -d
```
> ## Finally application dockerize and run : 
![image](https://github.com/user-attachments/assets/e2df7c4d-09d4-4bfd-b0db-fbe5e9ecc317)

> ## ⚠️ **Notes:** Attach local volume to Database container in docker-compose.yml file.

