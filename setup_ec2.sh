#!/bin/bash

# installing AWS CLI
sudo apt install awscli -y

# configuring AWSCLI
aws configure

# 1. enter your Access Key ID
# 2. enter your Secret Access Key
# 3. choose region close to you [*] (f.x. "eu-west-1")
# 4. enter "text"

# Creat SSH Key pair
aws ec2 create-key-pair --region eu-central-1 --key-name aws-instance \
    --query "KeyMaterial" --output text > SSH/aws-instance.pem

# set MYIP to external IP address
MYIP=$(curl -s http://myip.dnsomatic.com | grep -P '[\d.]')

# set ALLIP to 0.0.0.0/0
ALLIP="0.0.0.0/0"

echo $MYIP
echo $ALLIP

# create a new security group and save its returned ID to SGID
SGID=$(aws ec2 create-security-group --group-name aws-sec-group \
       --description "aws security group" --region eu-central-1)

# allow all IP's access to ports
aws ec2 authorize-security-group-ingress --group-name aws-sec-group \
    --protocol tcp --port 22 --cidr $ALLIP --region eu-central-1
aws ec2 authorize-security-group-ingress --group-name aws-sec-group \
    --protocol tcp --port 80 --cidr $ALLIP --region eu-central-1
aws ec2 authorize-security-group-ingress --group-name aws-sec-group \
    --protocol tcp --port 8787 --cidr $ALLIP --region eu-central-1
aws ec2 authorize-security-group-ingress --group-name aws-sec-group \
    --protocol tcp --port 443 --cidr $ALLIP --region eu-central-1

# Launch Instance (Ubuntu 16.04)
aws ec2 run-instances \
    --image-id ami-1e339e71 \
    --count 1 \
    --instance-type t2.micro \
    --key-name aws-instance \
    --security-group-ids aws-sec-group \
    --region eu-central-1 \
    --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 32 } } ]"
 
 # Get instances id and ip
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0],State.Name,PrivateIpAddress,PublicIpAddress]' --output text | column -t

# Get elastic IP addresses
aws ec2 describe-addresses

# Associate IP address
aws ec2 associate-address --instance-id <instance_id> --allocation-id <elastic_ip>

# SSH into instance
ssh -i SSH/aws-instance.pem ubuntu@<elastic_ip>

# Add new user
sudo adduser <username>
sudo adduser <username> sudo

# Copy ssh key
sudo mkdir /home/<username>/.ssh
sudo cp /home/ubuntu/.ssh/authorized_keys \
    /home/<username>/.ssh/authorized_keys
sudo cp /home/ubuntu/.ssh/authorized_keys \
    /home/tim/.ssh/authorized_keys
sudo chown <username> -R /home/<username>/.ssh
sudo chmod 700 /home/<username>/.ssh
sudo chmod 600 /home/<username>/.ssh/authorized_keys
