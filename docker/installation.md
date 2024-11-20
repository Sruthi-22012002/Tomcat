**DOCKER INSTALLATION**

1. **Update your package database**:

`  `sudo apt-get update










1. ![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.001.png)**Install required packages to allow apt to use a repository over HTTPS:**
**






1. **Add Docker's official GPG key:**

`      `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

1. **Add Docker’s APT Repository**









   ![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.002.png)


	


1. **Update the apt package index again**

   sudo apt-get update


1. **Install the latest version of Docker CE (Community Edition):**

   sudo apt-get install docker-ce docker-ce-cli containerd.io

1. **Verify the Docker installation:**

   docker --version

   docker run hello-world

![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.003.png)![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.004.png)![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.005.png)

![ref1]![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.007.png)![ref1]![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.008.png)

![ref2]

![ref2]![](Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.010.png)

[ref1]: Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.006.png
[ref2]: Aspose.Words.38e6fb71-f217-40dc-b478-3792c0541b83.009.png
