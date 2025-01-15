#!/bin/bash

# ! not fully tested, some permissions are missing on cloudguru playground

# 1
# vpc
echo "Creating VPC..."
gcloud compute networks create vpc --subnet-mode=custom

# subnet
echo "Creating subnet..."
gcloud compute networks subnets create subnet --network=vpc --range=10.0.0.0/24 --region=us-central1

# gcr
echo "Creating GCR..."
gcloud services enable containerregistry.googleapis.com
# (3 - gcr private)
echo "Setting GCR to private..."
gcloud projects add-iam-policy-binding $PROJECT_ID --member=user:$EMAIL --role=roles/storage.admin

# vm
echo "Creating VM..."
gcloud compute instances create vm --zone=us-central1-a --machine-type=e2-micro --subnet=subnet

# public ip
echo "Creating public IP..."
gcloud compute addresses create vm-ip --region=us-central1
gcloud compute instances add-access-config vm --zone=us-central1-a --address=$(gcloud compute addresses describe vm-ip --region=us-central1 --format="get(address)")

# firewall
echo "Creating firewall rule..."
gcloud compute firewall-rules create allow-http --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server