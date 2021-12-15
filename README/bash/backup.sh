#!/bin/bash

# create if does not exist
mkdir -p /var/backup

# create new .tar
tar cvvf /var/backup/home.tar /home

# rename tar to MMDDYYYY.tar
mv /var/backup/home.tar /var/backup/home.10012021.tar

# lists all files and pipes output
ls -lah /var/backup > /var/backup/file_report.txt

# lists free memory and pipes output
free -h > /var/backup/disk_report.txt
