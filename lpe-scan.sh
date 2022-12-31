#!/bin/bash

# Check for world-writable directories
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for world-writable directories..."
echo -e "-----------------------------------------------------\033[0m"
echo "World-writable directories are directories that can be written to by any user on the system. This can be a security risk if sensitive files are stored in these directories."
find / -type d -perm -2 ! -path "/sys*" -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for SUID executables
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for SUID executables..."
echo -e "-----------------------------------------------------\033[0m"
echo "SUID (Set User ID) is a permission that allows a user to execute a file with the permissions of the file's owner."
echo "This can be a security risk if the file is owned by root or if it is a program that allows users to execute arbitrary commands."
find / -type f -perm -4000 -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for SGID executables
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for SGID executables..."
echo -e "-----------------------------------------------------\033[0m"
echo "SGID (Set Group ID) is a permission that allows a user to execute a file with the permissions of the file's group."
echo "This can be a security risk if the file is owned by a group with excessive permissions or if it is a program that allows users to execute arbitrary commands."
find / -type f -perm -2000 -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for unauthorized SUID/SGID files
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for unauthorized SUID/SGID files..."
echo -e "-----------------------------------------------------\033[0m"
echo "SUID/SGID permissions should only be set on trusted executables. If they are set on an untrusted or unknown file, it may indicate a security risk."
find / -perm /6000 -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for .bash_history files
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for .bash_history files..."
echo -e "-----------------------------------------------------\033[0m"
echo ".bash_history files contain a record of all the commands that have been entered into the bash shell. These files should be protected to prevent unauthorized access to potentially sensitive information."
find / -name .bash_history -exec ls -ld {} \; 2>/dev

# Check for .ssh directory
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for .ssh directory..."
echo -e "-----------------------------------------------------\033[0m"
echo ".ssh directories contain files related to secure shell (SSH) access to the system. These files should be protected to prevent unauthorized access."
find / -name .ssh -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for known hosts file
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for known_hosts file..."
echo -e "-----------------------------------------------------\033[0m"
echo "The known_hosts file contains a list of all the SSH servers that the system has connected to in the past. It is used to prevent man-in-the-middle attacks."
find / -name known_hosts -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for authorized_keys file
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for authorized_keys file..."
echo -e "-----------------------------------------------------\033[0m"
echo "The authorized_keys file contains a list of public keys that are authorized to access the system via SSH. It should be protected to prevent unauthorized access."
find / -name authorized_keys -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for password files
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for password files..."
echo -e "-----------------------------------------------------\033[0m"
echo "Password files, such as /etc/shadow, contain encrypted passwords for all users on the system. These files should be protected to prevent unauthorized access and password cracking."
find / -name "*shadow*" -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for ssh configuration files
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for ssh configuration files..."
echo -e "-----------------------------------------------------\033[0m"
echo "SSH configuration files, such as /etc/ssh/sshd_config, contain settings for the SSH server. These files should be configured securely to prevent unauthorized access."
find / -name "sshd_config" -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for open ports
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for open ports..."
echo -e "-----------------------------------------------------\033[0m"
echo "Open ports are network ports that have an active listening service. These ports should be secured to prevent unauthorized access."
netstat -tulpn
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for kernel modules
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for kernel modules..."
echo -e "-----------------------------------------------------\033[0m"
echo "Kernel modules are pieces of code that can be loaded into the kernel at runtime to extend the kernel's functionality. These modules should be monitored to prevent the loading of malicious or unauthorized modules."
lsmod
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for cron jobs
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for cron jobs..."
echo -e "-----------------------------------------------------\033[0m"
echo "Cron is a daemon that runs scheduled tasks. These tasks, called cron jobs, should be monitored to prevent the execution of malicious or unauthorized tasks."
crontab -l
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for logged in users
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for logged in users..."
echo -e "-----------------------------------------------------\033[0m"
echo "Logged in users may have access to sensitive system resources. It is important to monitor and control access to these resources."
who
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for running processes
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for running processes..."
echo -e "-----------------------------------------------------\033[0m"
echo "Running processes may be using system resources or have the ability to access sensitive data. It is important to monitor and control these processes."
ps aux
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for listening processes
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for listening processes..."
echo -e "-----------------------------------------------------\033[0m"
echo "Listening processes are processes that are waiting for incoming connections. These processes should be monitored to prevent unauthorized access."
lsof -i -P -n
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Check for open file descriptors
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for open file descriptors..."
echo -e "-----------------------------------------------------\033[0m"
echo "File descriptors are references to open files. They can be used to access sensitive data or to manipulate system resources. It is important to monitor and control access to these descriptors."
lsof -nP +c 15
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

echo -e "\033[1;32mlpe-scan complete!\033[0m"
