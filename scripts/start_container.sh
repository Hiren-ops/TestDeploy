#!/bin/bash
docker stop sample-app||true
docker rm sample-app||true

docker build -t sample-app /home/ec2-user/app
docker run -d -p 80:3000 --name sample-app sample-app
