#!/bin/bash
  
#editing this script
#Create job for deleting hadoop logs.
 
echo "
#!/bin/sh
#Cleaning unused dir and logs
truncate -s 100 /var/opt/omi/log/omiserver.log
truncate -s 100 /var/log/azure/Microsoft.OSTCExtensions.LinuxDiagnostic/extension.log
rm -rf /var/log/messages-*
rm -rf /var/log/secure-*
find /var/log/hdp -type f -mtime +7 -exec rm -f {} \;
find /var/log/knox -type f -mtime +1 -exec rm -f {} \;
find /var/log/kafka -type f -mtime +1 -exec rm -f {} \;
find /var/log/hbase -type f -mtime +1 -exec rm -f {} \;
find /var/log/hadoop-yarn -type f -mtime +1 -exec rm -f {} \;
find /var/log/ambari-agent -type f -mtime +3 -exec rm -f {} \;
find /var/log/ambari-agent -type f -mtime +7 -exec rm -f {} \;
find /var/log/ranger -type f -mtime +1 -exec rm -f {} \;
find  /var/lib/rsyslog/ -type f -mtime +1 -exec rm -f {} \;
find /var/log/recipes -type f -mtime +1 -exec rm -f {} \; " > /etc/cron.daily/deletehdplog.sh
find /opt/dynatrace/oneagent/log/java/ -type f -mtime +1 -exec rm -f {} \; > /etc/cron.daily/deletehdplog.sh
chmod +x /etc/cron.daily/deletehdplog.sh

 
service chronyd restart

#create user hdfs if it is not exists
#groupadd hdfs
