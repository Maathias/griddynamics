#!/bin/bash

# 5
# run container on vm
echo "Running container..."
gcloud compute ssh vm --region=us-central1 --command="docker run -d -p 80:8080 gcr.io/$PROJECT_ID/spring-petclinic"