## 2. <b>DOCKER</b>
 
### 2.1. Container
 > Containers are isolated processes for each of your app's components. 
### Container VS Virtual machine

|   Container   |   Virtual machine   |
|:-----:|:-----:|
|   A container is simply an isolated process with all of the files it needs to run.  |   A VM is an entire operating system with its <b>own kernel</b>, hardware drivers, programs, and applications.   |
|   If you run multiple containers, they all share the <b>same kernel</b>, allowing you to run more applications on less infrastructure.   |   Uses a hypervisor to virtualize hardware.   |

### Image
   > A container image is a standardized package that includes all of the files, binaries, libraries, and configurations to run a container.

### 2.2 Simplified Procedure to Write a Dockerfile

  > A Dockerfile is a text file that contains a set of instructions to build a Docker image.
  > Create Dockerfile without  extension and type

#### 1. Start with a Base Image
   > Choose a lightweight base image to build your container from.
   ```bash
   FROM ubuntu:latest
 ```
#### 2. Set the Working Directory
> Define where commands will run inside the container.
  ```bash
   WORKDIR /app 
 ```
#### 3. Copy Files
> Transfer files from your machine to the container.
 ```bash
  COPY . /app
 ```
#### 4. Install Dependencies
> Add commands to install necessary software packages.
```bash
  RUN apt-get update && apt-get install -y python3
 ```
#### 5. Run Commands
> Execute setup scripts or configuration steps.
```bash
  RUN pip install -r requirements.txt
 ```
##### 5.1. requirement.txt
```bash
  Flask==2.3.3
  requests==2.31.0
  numpy==1.25.0
  pandas==2.1.2
 ```
#### 6. Expose Ports (optional)
> Make specific ports accessible.
```bash
  EXPOSE 8080
 ```
#### 6. Define the Command to Run
> Specify the main command your container will execute.
```bash
 CMD ["python3", "app.py"]
 ```
- **CREATE  A DOCKER IAMGE**

docker build -t <name to your image>

> ### Sample Docker file
```bash
   FROM python:3.9
   WORKDIR /app
   COPY . /app
   RUN pip install -r requirements.txt
   EXPOSE 5000
   CMD ["python3", "app.py"]
 ```

### 2.3 Steps to Build & Run:
#### 2.3.1. Build the image
```bash
 docker build -t my-app .
 ```
#### 2.3.2 Run the container
```bash
 docker run -d -p 5000:5000 my-app
 ```
> #### ✅ Info :
   > 1. –d  - Run the container in detached mode
   > 2. –p - Map port 5000 on your local machine to port 5000 inside the container.(8080,80 any port)
###  [3. Create a custom Dockerfile](https://github.com/Sruthi-22012002/DevOps-Azure/tree/main/Docker/create-custom-nginx)


