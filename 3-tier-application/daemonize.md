##  Daemonize the services
### 1. Java Backend
* Move out of the project file
  ![image](https://github.com/user-attachments/assets/588ef971-ffe2-4909-823c-f2cec297c1aa)
  * create a /opt/java-backend folder
  * Copy the backend *.jar file to this folder
  * Move to backend folder, run this commands
    ```bash
    mvn clean install
    ```
    ![image](https://github.com/user-attachments/assets/a2a9cd3d-8b23-435d-a4a5-698167105048)
 * open the target folder and copy the *.jar file to opt/java-backend folder
     ```bash
     sudo cp -r /home/sruthi/ems-ops-phase-0/springboot-backend/target/springboot-backend-0.0.1-SNAPSHOT.jar /home/sruthi/opt/java-backend/
     ```
* Create a app_ems.service to  created service file under /etc/systemd/system/
  
 ```bash
 sudo nano /etc/systemd/system/app_ems.service
  ```
 * Paste this code :
      ```bash
       [Unit]
        Description=StudentsystemApplication Java service
        After=syslog.target network.target
        
        [Service]
        SuccessExitStatus=143
        User=sruthi //Os username
        Type=simple
        Restart=on-failure
        RestartSec=10
        
        WorkingDirectory=/opt/java-backend/
        ExecStart=/usr/bin/java -jar springboot-backend-0.0.1-SNAPSHOT.jar
        ExecStop=/bin/kill -15 $MAINPID
        
        [Install]
        WantedBy=multi-user.target
        ```
* Daemon Reload & systemctl cmd
   ```bash
    sudo systemctl daemon-reload
    sudo systemctl start app_ems.service
    systemctl status app_ems.service
  ```
### 2. Frontend
* create a folder opt/react-backend
      ```bash
       mkdir opt/react-backend
      ```
  * move to frontend folder
    > ~/ems-ops-phase-0/react-hooks-frontend$
  * start the application
    ```bash
       npm run build
    ```
> After build the application, build/ folder is created inside the frontend
![image](https://github.com/user-attachments/assets/4019dde1-a0c9-4be8-be46-708f4d828df9)
* Move the folder to /opt/react-backend folder
   ```bash
     sudo cp -r /home/sruthi/ems-ops-phase-0/react-hooks-frontend/build/ /home/sruthi/opt/react-backend/
     ```
* Install Serve node package
   ```bash
   npm install -g serve
   ```
* Create systemD service for frontend
 ```bash
  sudo nano /etc/systemd/system/reactapp_ems.service
```
* Paste this code :
   ```bash
        [Unit]
        Description=StudentsystemApplication React service
        After=syslog.target network.target
        
        [Service]
        SuccessExitStatus=143
        User=sruthi // os username
        Type=simple
        Restart=on-failure
        RestartSec=10
        
        WorkingDirectory=/opt/react-backend/
        ExecStart=serve -s build
        ExecStop=/bin/kill -15 $MAINPID
        
        [Install]
        WantedBy=multi-user.target
    ```
* Daemon Reload & systemctl cmd
  ```bash
    sudo systemctl daemon-reload
    sudo systemctl start reactapp_ems.service
    systemctl status reactapp_ems.service
  ```  
> Both frontend and backend daemonize
  ![image](https://github.com/user-attachments/assets/28174231-172e-4cea-8665-3696bade7e5e)
