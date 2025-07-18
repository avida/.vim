#!/bin/bash

# Update package lists and install dependencies
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

# Import the Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add the Google Cloud SDK repository
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Update package lists and install the gcloud CLI
sudo apt-get update && sudo apt-get install -y google-cloud-cli

# Initialize the gcloud CLI
gcloud init
