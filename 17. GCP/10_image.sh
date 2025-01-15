#!/bin/bash

# 2
# push image
gcloud auth configure-docker

docker tag spring-petclinic gcr.io/$PROJECT_ID/spring-petclinic
docker push gcr.io/$PROJECT_ID/spring-petclinic