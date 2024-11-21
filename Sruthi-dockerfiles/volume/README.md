## Volume is to store the changes of the image after stop the container through localhost:<port>

![localhost:8080](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.001.png)

## Create a new volume in the current directory

```bash
  docker volume create web-data
```
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.002.png)

## Check the avaliable volume in the current directory

```bash
  sudo docker volume ls
```
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.003.png)

## If the volume web-data already exists, it will be mounted to the Nginx container at /usr/share/nginx/html

```bash
  sudo docker run --rm -it -v web-data:/usr/share/nginx/html nginx
```
* docker run : create and run a container from a specified image.
* --rm : Automatically removes the container when it exits. This is useful for temporary containers that are not needed after they stop.
* -it : The -i option allows the container to run interactively (keeps the STDIN open).The -t option allocates a pseudo-TTY (terminal) to the container, making the terminal output readable and interactive.
* -v web-data:/usr/share/nginx/html : This mounts a Docker volume called web-data to the /usr/share/nginx/html directory inside the container.
* The web-data volume will persist data outside of the container and can be shared between containers.
![new vloume:web-data](https://github.com/Ranjitha75388/Tomcat/raw/main/Sruthi-dockerfiles/volume/Aspose.Words.d89a1ccf-1657-4ad3-a9df-32dbbe117dc4.003.png)



