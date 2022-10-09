#!/bin/bash

RESOURCE_GROUP_NAME=WinSer-RG
VM_NAME=MyWinServer
IMAGE=Win2022Datacenter
ADMIN_USER=winserveruser
ADMIN_PASSWD=Mypasswd#1
PUBLIC_IP_CLASS=Standard
STORAGE_ACCOUNT_NAME=mystorageacct$RANDOM
DATA_REPLICATION_CLASS=Standard_LRS
CONTAINER_NAME=mystorageacctcontainer$RANDOM
APPSERVICE_PLAN_NAME=my-plan$RANDOM
WEBAPP_NAME=my-web-app$RANDOM 
DEPLOYMENT_SOURCE=https://github.com/Azure-Samples/html-docs-hello-world 

# Create a Resource Group
az group create --name $RESOURCE_GROUP_NAME --location westus

# Create a Virtual Machine
az vm create --name $VM_NAME --resource-group $RESOURCE_GROUP_NAME --location westus --public-ip-sku $PUBLIC_IP_CLASS --image $IMAGE --admin-user $ADMIN_USER --admin-password $ADMIN_PASSWD

# Create storage account   
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku $DATA_REPLICATION_CLASS --encryption-services blob

# Create a blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME 

# Enable static website hosting
az storage blob service-properties update --account-name $STORAGE_ACCOUNT_NAME --static-website --index-document index.html

# Upload website folders from local path to Azure Storage Blob Container
az storage blob upload-batch --source $WebsiteFilePath --destination '$web' --account-name $STORAGE_ACCOUNT_NAME

# Display website URL
az storage account show -n $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --query "primaryEndpoints.web" --output tsv

# Create an App Service Plan
az appservice plan create --name $APPSERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME --location eastus --sku F1

# Create a Web App
az webapp create --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME --plan $APPSERVICE_PLAN_NAME 

# Deploy an app from GitHub to Azure App Service
az webapp deployment source config --repo-url $DEPLOYMENT_SOURCE --branch master --manual-integration --name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME
