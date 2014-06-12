* Git

All the file can be in two states, untracked and tracked. The untracked file has not been added to the git repository from last snapshot whereas the tracked file can be found in the last snapshot. The tracked file can be unmodified, modified and stages. When you modified a file, the file is modified but not in staging area. When the command git add is issued, the file becomes staged. The command git commit create a new snapshot and all the file becomes unmodified.

* Public Key

- =ssh-keygen -t rsa=

* Iaas/Paas/Saas

Iaas - Infrastructure as a Service
Openstack, ESXi, RHEV can be examples of Iaas. The server run on cloud and provides Virtual Machine (VM) to clients. Consumers can access the server via client tool or web browser. They can create many VMs as they can, depending on the resources on the server. They can modify VMs, for example, adding more resources, RAM or storage into the VMs. Some services allow consumers to access the VMs by web browser.

Paas - Platform as a Service
Openshift can be a example of Paas. Openshift provides many application server to consumers.The application servers are run on cloud. Consumers are only need a few click and the servers are available just a minute. The application server including JBoss, Tomcat. There are many frameworks available, for example, Python Django, PHP Codeigniter/ Laravel etc.. 

Saas - Software as a Service
There are many Saas examples. Gmail is an exmaple that is a mail user agent which is a kind of software to allow user to check emails. Consumers access the software via web browser. Enterprise resource planning system (ERP) is a business software and there are many enterprises using the system to manage their warehouse, supply chain, product etc. The system usually runs in private cloud and staff or administrator can access the system via web browser to manage the resource of the enterprise.

* Linux LFS
/home 		- home directory of local user
/usr/bin	- user binaries by package management system (yum, dpkg ...)
/usr/local/bin	- user binaries
/var		- variables, file inside the folder will be changed along the time (log, database ..)
/var/log	- log file in local system (apache access/ error log, mysql ..)
/etc		- configuration file (postfix, dhcpd, ..)
/dev		- essential device
/tmp		- temporary file stores insides the folder, all the file will be removed after reboot

* Misc
What's a terminal?	- Terminal provides a way to receive text input from user and display the output text to the user
What is a shell? 	- Shell is a command line interpreter, which is a program to interpret lines of text entered by user.
What is Bash		- Bash is a unix shell and a command processor. 
What is an environment variable? 	- The variables are system-wide and can affect the behaviour of the program. Program can know the home directory by knowing the variables $HOME
How to set an environment variable for a session?	- key=val
How to set an environment variable for all sessions?	- export key=val
What standard environment variables do you know?	- $PATH, $HOME, $TEMP ...
What is a Bash alias?	- shortcut of a command, such as alias ls="ls --color", ls will always display in color
What is the syntax of a if test?	- if [ condition ]; then #something fi
What is the syntax of a for loop?	- for i in condition; do #something done
What is the syntax of a while loop?	- while [ condition ]; do #something done

* Emails
MUA	- Mail User Agent
A user program to check or compose email, such as gamil or outlook etc.

MTA	- Mail Transfer Agent
A program transfers a email from a computer. If the recipient is not hosted locally, the mail is replayed. The program will forward the email to the relayhost.

MDA	- Mail Delivery Agent
A program delivers a email to a local recipient. 
