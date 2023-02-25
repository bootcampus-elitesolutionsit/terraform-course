#!/bin/bash
exec > >(tee /tmp/test.log) 2>&1

file=logs.txt
if [ -f $file ]
then 
  echo " $file exist " > ouput.txt
else 
 echo " $file do not exist " > results.txt
fi

IP_FILE="$HOME/ipaddressfile"
if [ -f "$IP_FILE" ]; then
  KNOWN_IP=$(cat "$IP_FILE")
else
  touch "$HOME/ipaddressfile"
fi

CURRENT_IP=$(curl http://ifconfig.me/ip)

#See if the IP has changed
#Subject: is piped to mail command
if [ "$CURRENT_IP" != "$KNOWN_IP" ]; then
  echo "$CURRENT_IP" > "$IP_FILE"
  echo "Subject: The IP Address at home has changed
  The IP address at home has been changed to $CURRENT_IP"
else
  echo "Subject: The IP Address at home is the same
  The IP address at home stayed the same $CURRENT_IP"
fi

cat $HOME/ipaddressfile > ipaddressfile.ip

sudo yum -y update
sudo amazon-linux-extras install php8.0 mariadb10.5 -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform -help > $HOME/terraform.txt