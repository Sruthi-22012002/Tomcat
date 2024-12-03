#!/bin/bash

# Define your Tomcat service name
TOMCAT_SERVICE="tomcat"

# Define the recipient email
RECIPIENT=sruthivg22@gmail.com

# Define the subject and message for starting or stopping Tomcat
START_MESSAGE="Tomcat has started."
STOP_MESSAGE="Tomcat has stopped."

# Check the status of the Tomcat service
if systemctl is-active --quiet $TOMCAT_SERVICE; then
    # Tomcat is running, do nothing
    STATUS="running"
else
    # Tomcat is not running, send stop alert
    STATUS="stopped"
fi

# Create a log file to track status changes
LOG_FILE="/var/log/tomcat_status.log"

# Record the status and send email if the status has changed
if [[ "$STATUS" == "running" && ! -f "$LOG_FILE" || "$(tail -n 1 $LOG_FILE)" != "Tomcat is running" ]]; then
    echo "Tomcat is running" >> $LOG_FILE
    echo "Tomcat has started at $(date)" | mail -s "Tomcat Started" $RECIPIENT
elif [[ "$STATUS" == "stopped" && ! -f "$LOG_FILE" || "$(tail -n 1 $LOG_FILE)" != "Tomcat is stopped" ]]; then
    echo "Tomcat is stopped" >> $LOG_FILE
    echo "Tomcat has stopped at $(date)" | mail -s "Tomcat Stopped" $RECIPIENT
fi

