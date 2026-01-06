#!/bin/bash

AWS_REGION=me-central-1
ACCOUNT_ID=767397902739
IMAGE_NAME=sample-app
IMAGE_TAG=latest

aws ecr get-login-password --region $AWS_REGION | \
docker login --username AWS --password-stdin \
$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker pull $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG

docker stop sample-app||true
docker rm sample-app||true

docker run -d \
  --name sample-app \
  -p 80:3000 \
  $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG
