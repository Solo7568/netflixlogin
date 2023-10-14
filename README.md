# Netflixlogin Page

I have Used Shelll Scripting for Automation Process
#SheBang
#! /bin/bash 

#Installing The Git --
yum install git -y

#To Check The Git Version -- 
git --version

#Installing The Application Server --
yum install httpd -y

#Starting the Server --
systemctl start httpd

#Checking  the status of the Server --
systemctl status httpd

#changing the directory to executable Path of the Application Server --
cd /var/www/html

#Cloning the Source Code --
git clone https://github.com/Solo7568/netflixlogin.git

#moving the contents to Current Directory --
mv netflixlogin/* .

#Restarting the Application Server --
systemctl restart httpd

#Checking the Status of the Server --
systemctl status httpd


