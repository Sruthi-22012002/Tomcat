## Create a custom Dockerfile
> custom dockerfile is about to run /html file automatically
### 1. Create a simple index file in /html directory
```bash
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Custom Nginx!</title>
</head>
<body>
    <h1>Hello from Custom Nginx Container!</h1>
</body>
</html>
```
#### 2. Create a Nginx Dockefile
> Use the official Nginx image as the base
```bash
    FROM nginx:latest
```
> Copy your static files (optional)
```bash
    COPY ./html /usr/share/nginx/html
```
> Expose port 80 for web traffic
```bash
    EXPOSE 80
```
> Start Nginx
```bash
   CMD ["nginx", "-g", "daemon off;"]
```
### 3. Build and Run the Custom Nginx Container
> 3.1. Build the Docker image
```bash
    docker build -t custom-nginx .
```
> 3.2. Run the container
```bash
    docker run -d -p 80:80 custom-nginx
```
> 3.3. Access the Nginx server:
Open your browser and go to [localhost:8080](http://localhost:80).


