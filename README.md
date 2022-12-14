# Deploy Resources to Azure Using Script
<img src="https://github.com/imohweb/Deploy-AzResources-Script/blob/master/src/azure-cli.jpg" alt="Azure CLI Logo" width="300" height="300" align="center"></img><br>
This repository gives you a single script named <a href="https://github.com/imohweb/Deploy-AzResources-Script/blob/master/deploy-resources-to-azure-script.sh">**deploy-resources-to-azure-script.sh**</a>. When you run the script on your terminal it automates the deployment of the following resources to Azure:
1.  Azure Resource Group,
2.  Azure Virtual Machines, 
3.  Azure Storage Account,
4.  Azure Storage Containers
5.  Enable static website hosting on the Azure Storage account
6.  Upload website content to the storage Container from the local PC
7.  Create an App Service Plan
8.  Deploy Web App
9.  Deploy an app from GitHub to Azure App Service
10.  and many more

The script is constantly updated to keep users abreast with the updated version of Azure CLI commands. 

## Prerequisites for Using this Script
1. You must have an active Subscription on Azure. If you do not have one, sign up <a href="https://azure.microsoft.com/en-us/free/" target="_blank">here</a> for the free trial account. 
2. Download the Azure CLI 2.40 MSI installer <a href="https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest&tabs=azure-cli" target="_blank">here</a> and run it on your Local PC.
3. Run the **az login** command to sign into your account on Azure
4. Run the **az** command to confirm that you have successfully Installed the CLI <br>
<img src="https://github.com/imohweb/Deploy-AzResources-Script/blob/master/src/azure-cli1.png"></img>
5. Run the **az version** command to check the Azure CLI Version you have just installed
<img src="https://github.com/imohweb/Deploy-AzResources-Script/blob/master/src/Azure%20CLI%20Version.png">
6. To create Resources directly on a particular subscription if you have many subscriptions on your Azure account, <br> run the **az account set --subscription $MySubscription** command. 
