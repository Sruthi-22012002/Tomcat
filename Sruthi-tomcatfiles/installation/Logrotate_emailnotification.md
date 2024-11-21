`                   `Alert mail notification for crontab


Receive mail if tomcat get started 

Tomcat Started alert :      ![](Aspose.Words.4034d854-33ac-42a2-9f75-85d0a5ae7643.001.png)

Tomcat stopped alert :

![](Aspose.Words.4034d854-33ac-42a2-9f75-85d0a5ae7643.002.png)

1. Create a .sh script file 
1. Crontab -e
1. Schedule the job 
   1. \*\*\*\*\*\* / path
1. Crontab -l  to check the job is running
1. Check the email to get the alert message
1. sudo systemctl start tomcat
1. sudo systemctl status tomcat
1. sudo systemctl stop tomcat

TO SET EMAIL NOTIFICATION

1. sudo apt-get install mailutils
1. Email notification configuration script file

   |<p>#!/bin/bash</p><p></p><p># Log file and email recipient configuration</p><p>LOG\_FILE="/home/sruthi/tomcat\_status.log"</p><p>RECIPIENT="your\_email@example.com"  # Replace with your email address</p><p></p><p># Get the current status of Tomcat</p><p>STATUS=$(systemctl is-active tomcat)</p><p></p><p># Check if Tomcat is stopped and whether the status has changed</p><p>if [[ "$STATUS" == "inactive" && ( ! -f "$LOG\_FILE" || "$(tail -n 1 $LOG\_FILE)" != "Tomcat is stopped" ) ]]; then</p><p>`    `# Log the status to the log file</p><p>`    `echo "Tomcat is stopped" >> $LOG\_FILE</p><p></p><p>`    `# Send an email notification</p><p>`    `echo "Tomcat has stopped at $(date)" | mail -s "Tomcat Stopped Alert" $RECIPIENT</p><p>fi</p><p></p><p># Optional: You can also check if Tomcat is running and send an email when it starts</p><p>if [[ "$STATUS" == "active" && ( ! -f "$LOG\_FILE" || "$(tail -n 1 $LOG\_FILE)" != "Tomcat is running" ) ]]; then</p><p>`    `# Log the status to the log file</p><p>`    `echo "Tomcat is running" >> $LOG\_FILE</p><p></p><p>`    `# Send an email notification</p><p>`    `echo "Tomcat has started at $(date)" | mail -s "Tomcat Started Alert" $RECIPIENT</p><p>fi</p><p></p><p></p>|
   | :- |
1. chmod +x /home/sruthi/tomcat\_alert.sh
1. /home/sruthi/tomcat-deployment/logrotate/tomcat\_alert.sh
1. Crontab -e
1. \* \* \* \* \* /home/sruthi/tomcat\_alert.sh

Sample mail check

1. sudo apt-get install msmtp msmtp-mta
1. nano ~/.msmtprc
1. To get app password 
   1. Open google account
   1. Personal info
   1. App password
   1. Create new application
   1. Copy 16 digit number

|<p>account default</p><p>host smtp.gmail.com</p><p>port 587</p><p>from <your\_email@gmail.com></p><p>auth on</p><p>user <your\_email@gmail.com></p><p>password <your\_password></p><p>tls on</p><p>tls\_trust\_file /etc/ssl/certs/ca-certificates.crt</p><p></p><p></p>|
| :- |
1. chmod 600 ~/.msmtprc
1. echo "Test email body" | msmtp sruthivg22@gmail.com 

   ![](Aspose.Words.4034d854-33ac-42a2-9f75-85d0a5ae7643.003.png)
