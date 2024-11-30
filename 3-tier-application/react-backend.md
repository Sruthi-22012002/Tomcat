## Set up the backend
[Download ems-ops-phase-0.zip](https://github.com/Ranjitha75388/Tomcat/blob/main/3-tier-application-task/ems-ops-phase-0.zip)

### Move the project from local to wsl
```bash
mv /mnt/c/Users/sreem/Downloads/ems-ops-phase-0.zip /home/sruthi/
```
### Unzip the project
```bash
unzip ems-ops-phase-0.zip
```
### Move to the backend directory
> ~/ems-ops-phase-0/springboot-backend$
### Open application.properties to update database
```bash
sudo nano /src/main/resources/application.properties
```
![image](https://github.com/user-attachments/assets/68fc7f6e-a5de-494f-84b3-b887b8fa8a81)
* spring.datasource.url=jdbc:mysql://localhost:3306/<b>databasename</b>?useSSL=false
* spring.datasource.username=<b>username</b>
* spring.datasource.password=<b>password</b>
### Move to pom.xml folder
> ~/ems-ops-phase-0/springboot-backend$ 
### Run the pom.xml to install the dependencies inside the pom file using maven tool
```bash
mvn clean
```
### Build the backend application
```bash
mvn install
```
* After the installation, <b>target/</b> folder created.
  ![image](https://github.com/user-attachments/assets/bf3886bb-ddd7-4791-b84d-362f9a1b6cc2)
* Inside the target/ folder, *jar is created
  ![image](https://github.com/user-attachments/assets/6ed9a612-38d5-4bc4-83c8-ded5e2d1b2e0)
### Run the jar file inside the folder
```bash
java -jar springboot-backend-0.0.1-SNAPSHOT.jar
```
![image](https://github.com/user-attachments/assets/ee66f57e-b0cb-4be4-bb3c-e41c87e52039)

## Error
### Err 1 :
![Error](https://github.com/user-attachments/assets/9cf4062b-dd5b-4460-8808-50435b66f9be)
### Err 2 :
![Build failure](https://github.com/user-attachments/assets/01b4fef8-fed1-49c2-8336-85017a5eccd0)

### soln : 
Check the database URL in application.properties
