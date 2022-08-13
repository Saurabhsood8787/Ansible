#!/bin/bash

echo updating sshd_config file to accept password...
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo updated sshd_config file to accept password

echo restarting sshd service.......
service sshd restart
echo restarting sshd service

echo creating new user........
adduser auser
echo user created

echo adding user to sudo group...........
usermod -aG sudo auser
echo user added to sudo group

echo updating apt now.....................
sudo apt update
sudo apt-get update

echo updated apt

echo installing java...........................
sudo apt install default-jre
echo java installed

echo installing ansible......................
sudo apt install ansible
echo ansible installed

echo installing tree......................
sudo apt install tree
echo tree installed

echo installing jenkins.......
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo service jenkins start

