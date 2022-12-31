#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]
then
    echo "*********************************************************"
    echo "Please run this script as root to ensure it can access all system files and directories."
    echo "*********************************************************"
    exit
fi

# Check for world-writable directories
echo "-----------------------------------------------------"
echo "Checking for world-writable directories..."
echo "-----------------------------------------------------"
find / -type d -perm -2 ! -path "/sys*" -exec ls -ld {} \;
echo "-----------------------------------------------------"

# Check for SUID executables
echo "-----------------------------------------------------"
echo "Checking for SUID executables..."
echo "-----------------------------------------------------"
echo "SUID (Set User ID) is a permission that allows a user to execute a file with the permissions of the file's owner."
echo "This can be a security risk if the file is owned by root or if it is a program that allows users to execute arbitrary commands."
find / -type f -perm -4000 -exec ls -ld {} \;
echo "-----------------------------------------------------"

# Check for SGID executables
echo "-----------------------------------------------------"
echo "Checking for SGID executables..."
echo "-----------------------------------------------------"
echo "SGID (Set Group ID) is a permission that allows a user to execute a file with the permissions of the file's group."
echo "This can be a security risk if the file is owned by a group with excessive permissions or if it is a program that allows users to execute arbitrary commands."
find / -type f -perm -2000 -exec ls -ld {} \;
echo "-----------------------------------------------------"

# Check for unauthorized SUID/SGID files
echo "-----------------------------------------------------"
echo "Checking for unauthorized SUID/SGID files..."
echo "-----------------------------------------------------"
echo "SUID/SGID permissions should only be set on trusted executables. If they are set on an untrusted or unknown file, it may indicate a security risk."
find / -perm /6000 -exec ls -ld {} \;
echo "-----------------------------------------------------"

# Check for .bash_history files
echo "-----------------------------------------------------"
echo "Checking for .bash_history files..."
echo "-----------------------------------------------------"
echo ".bash_history files contain a record of all the commands that have been entered into the bash shell. These files should be protected to prevent unauthorized access to potentially sensitive information."
find / -name .bash_history -exec ls -ld {} \;
echo "-----------------------------------------------------"

# Check for .ssh directory
echo "-----------------------------------------------------"
echo "Checking for .ssh directory..."
echo "-----------------------------------------------------"
echo ".ssh directories contain files related to secure shell (SSH) access to the system. These files should be protected to prevent unauthorized access."
find / -name .ssh -exec ls -ld {} \;
echo "-----------------------------------------------------"

# Check for known hosts file
echo "-----------------------------------------------------"
echo "Checking for known_hosts file..."
echo "-----------------------------------------------------"
echo "The known_hosts file contains a list of all the SSH servers that the system has connected to in the past. It is used to prevent man-in-the-middle attacks."
find / -name known_hosts
