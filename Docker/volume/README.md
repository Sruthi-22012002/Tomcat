### 4. Volume 
> Volume is to store the changes of the image after stop the container through localhost:<port>
#### sample custom nginx page
![localhost:8080](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.001.png)

#### 4.1. Create a new volume in the current directory

```bash
  docker volume create web-data
```
## 4.2. Check the avaliable volume in the current directory

```bash
  sudo docker volume ls
```

## 4.3. If the volume web-data already exists, it will be mounted to the Nginx container at /usr/share/nginx/html

```bash
  sudo docker run --rm -it -v web-data:/usr/share/nginx/html nginx
```
* docker run : create and run a container from a specified image.
* --rm : Automatically removes the container when it exits. This is useful for temporary containers that are not needed after they stop.
* -it : The -i option allows the container to run interactively (keeps the STDIN open).The -t option allocates a pseudo-TTY (terminal) to the container, making the terminal output readable and interactive.
* -v web-data:/usr/share/nginx/html : This mounts a Docker volume called web-data to the /usr/share/nginx/html directory inside the container.
* The web-data volume will persist data outside of the container and can be shared between containers.
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.003.png)

## 4.4 Run an Nginx container in detached mode and mount a volume (or directory) from your host machine to the container's web directory, you can use the following command:

```bash
  sudo docker run -d -v web-data:/usr/share/nginx/html nginx
```
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.004.png)

## 4.5. This command is used to execute a command inside a running Docker container.

```bash
  sudo docker exec -it 8f7fe00fb881d74651d9a8d5695b9285b8b18 /bin/bash
```
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.005.png)

## 4.6  Open the script

```bash
* cd /usr/share/nginx/html
* sudo nano index.html
```
## 4.7. change the code 
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.007.png)
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.008.png)

## 4.8. Stop the localhost

```bash
sudo docker stop <container-id>
```
## 4.9. Start the container in the [localhost:8081](http://localhost:8081)
```bash
sudo docker start <container-id>
```
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.011.png)
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.012.png)

```text
Finally changes made.Refer the above screenshots.
```






