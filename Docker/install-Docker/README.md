
### 1. DOCKER INSTALLATION

## 1.1. Update your package database
```bash
  sudo apt-get update
```
## 1.2. Install required packages to allow apt to use a repository over HTTPS
```bash
   sudo apt-get install \
  	apt-transport-https \
  	ca-certificates \
  	curl \
  	software-properties-common
```
## 1.3. Add Docker's official GPG key
```bash
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
## 1.4. Add Docker’s APT Repository
```bash
    sudo add-apt-repository \
    deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
```
## 1.5. Update the apt package index again
```bash
sudo apt-get update
```
## 1.6. Install the latest version of Docker CE (Community Edition):
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
## 1.7. Verify the Docker installation:
```bash
docker --version
```
### Sample image
```bash
docker run hello-world
```
### [Steps-to-create-Dockerfile](https://github.com/Sruthi-22012002/DevOps-Azure/blob/main/Docker/Steps-to-create-a-Dockerfile/README.md)
