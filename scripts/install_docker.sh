#!/bin/bash
yum update -y
amason-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
