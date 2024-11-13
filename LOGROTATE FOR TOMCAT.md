**LOGROTATE FOR TOMCAT**

**Step :1 create logrotate configuration**

- Open a terminal 
- create a new configuration file for tomcat in the /etc/logrotate.d/ directory 
- **sudo nano /etc/logrotate.d/tomcat**

**Step :2 Define the Logrotate Rules to manage Catalina.out log file**

Add the following configuration to the file. Replace /path/to/tomcat/logs/ with the actual path to your Tomcat log directory (e.g., /opt/tomcat/logs):

/opt/tomcat/logs/\*.log { 

` `hourly missingok

` `rotate 24

` `compress

` `delaycompress

` `notifempty

` `create 640 tomcat tomcat

` `sharedscripts 

` `postrotate

` `systemctl reload tomcat || true 

` `endscript 

` `}

**Log Path and File pattern**

**/opt/tomcat/logs/\*.log {**

- Targets all .log files in the /opt/tomcat/logs/ directory.
- This configuration applies to any log file with the .log extension in the specified directory.

**Directive Breakdown**

1. ***Skip Missing files***

` `**Missingok**

- Prevents errors if the specified log files are missing.
- If a log file does not exist during the rotation cycle, logrotate will skip it and continue without producing an error message.
1. ***Number of Log rotations to keep***

` `**rotate 24**

- Keeps the last 24 rotated log files.
- When the limit (24 files) is reached, the oldest log file is deleted to free up disk space. This ensures that log management is efficient and does not consume excessive storage.

***3.Compression***

`   `**Compress**

`   `**delaycompress**

- **compress**: Compresses the rotated log files to save disk space. The files are typically compressed using gzip, resulting in .log.gz files.
- **delaycompress**: Delays compression of the most recent rotated log file until the next rotation.
  - **Why?**: Ensures that the most recent rotated log is easily accessible without requiring decompression.

***4.Skip empty Logs***

**Notifempty**

- Skips rotation if the log file is empty.
- Prevents unnecessary rotation and avoids clutter with empty log files.

***5. Create New Logs with specific Permissions***

**create 640 tomcat tomcat**

- **create 640**: Specifies the permissions for the new log file:
  - Owner (6): Read and write.
  - Group (4): Read only.
  - Others (0): No access.
- **tomcat tomcat**: Sets the ownership of the new log file to the tomcat user and group.

***6. Shared Script***

**Sharedscripts**

- Ensures that the postrotate script runs only once, even if multiple log files are rotated.
- Prevents the script from executing for each individual log file, improving efficiency.

***7. Post-Rotate Script***

`    `**postrotate**

`        `**systemctl reload tomcat || true**

`    `**endscript**

- **postrotate**: Specifies commands to run after logs are rotated.
- **systemctl reload tomcat**: Reloads the Tomcat service to ensure it starts writing to the new log file after rotation.
- **|| true**: Prevents errors from stopping the logrotate process if the systemctl command fails.
- Ensures that the Tomcat server continues logging seamlessly after rotation.

**Step : 3 Verify Ownership and Permissions**

Ensure that the log files and directory are owned by the tomcat user and group. Adjust permissions if necessary:

- **sudo chown -R tomcat:tomcat /path/to/tomcat/logs**
- **sudo chmod 640 /path/to/tomcat/logs/\*.log**

**Step :4 Test the Logrotate Configuration**

Run the following command to test your configuration:

- **sudo logrotate -d /etc/logrotate.d/tomcat**

This will simulate the rotation and check for errors without making actual changes.

**Step : 5 Setup cron tab to run every minute**

Crontab -e 

\* \* \* \* \* /usr/local/bin/check\_tomcat.sh





