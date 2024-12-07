## push docker image to private repository
### 1. Login to the docker iamge official website [dockerhub official](https://hub.docker.com/_/docker)
```bash
docker login
```
### 2. create a new repository as private
### 3. Build the image
> 3.1. In your project directory, ensure you have a Dockerfile
> 3.2. Build the image by running the following command in the VS Code terminal:
   * dockerhub-username - sruthivg22012002
   * image-name - nginx
   * tag - latest
```bash
docker build -t <dockerhub-username>/<image-name>:<tag> .
```
### 4. Push the image to your dockerhub repository
```bash
sudo docker push sruthivg22012002/myapp:latest
```

![image](https://github.com/user-attachments/assets/427a5c09-113c-4de4-9917-1e16f90fc52e)

