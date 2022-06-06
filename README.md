# iac-demo

==NOTE==: You can run this instruction from a linux terminal or Windows WSL2 with a Linux terminal.

## Before provisioning, create a directory called ssh and run the following command:
```
ssh-keygen -t rsa -b 4096 -C "adminuser" -f ssh/id_rsa
```

## Sign-in with Azure:

1. Run the following command:
```
az login
```
The output of the command provides one address and an OTP password. Go to the browser and navigate to the address provided and introduce the OTP password. Then the system is going to ask for the credentials to use in Azure.

2. If you have multiples subscription, you have to scope them with the following command
```
az account set --subscription <WORKING SUBSCRIPTION ID HERE>
```
3. Into the main.tf code, you have to change the Subscription ID:
```
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "<SUBSCRIPTION ID HERE>"
}
```

## Provisioning and Configuring

1. The steps require you to sign-in in Azure and to scope the working environment to avoid problems (limit the subscription id)
2. Run:
```
Terraform init
```
3. Run:
```
Terraform plan
```
4. Run and introduce 'yes' when asked:
```
Terraform apply
```

## Validate

1. Run:
```
Terraform output
```
You can have the IP of the Virtual Machine and go to http://<IP>
A web page is going to show

2. Connecting with SSH to the VM, inspect the Ansible manifest, and validate the configuration. 
```
 ssh -i ssh/id_rsa adminuser@<IP>
```

3. Go to the Azure portal, in the tenant and subscription used as working environment, and look for the resources with the resource group called iac-demo-rg, and inspect the main.yml to check all resources created by Terraform.
