# Linux-Privilege-Escalation
A script designed to help identify vulnerabilities and misconfigurations on a Linux system

 It is a useful tool for performing a quick security assessment of a system, but it is important to note that it is not a comprehensive security tool and should not be used as a replacement for a more thorough security assessment.

## Script helps you to find 
- world-writable directories
- SUID executables
- SGID executables
- unauthorized SUID/SGID files
- .bash_history files
- .ssh directory
- known hosts file
- authorized_keys file
- password files
- ssh configuration files
- open ports
- kernel modules
- cron jobs
- logged in users
- running processes
- listening processes
- file descriptors

## How to run it 
```bash
chmod +x lpe-scan.sh
./lpe-scan.sh
# To Save results as txt file 
./lpe-scan.sh > scan-results.txt
```
