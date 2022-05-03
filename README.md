# Terraform_Ansible

This repo contains code to create an Amazon EC2 instance using terraform and startup a Nginx web server on it. 

## Terraform for IaaS
Terraform has been used to create the AWS infrastructure necessary to create an EC2 instance capable of hosting Nginx web server and accessing only HTTPS requests. 
Modules have been created for:
1. VPC and networking 
2. Security Groups
3. Subnets
4. EC2 instance 

The installation of Nginx and configuration has been done through ansible - install_nginx.yml

## How to run the code

To run the code, clone this repository onto a linux server. Prerequisites are as follows:
1. Python and Ansible installed
2. Terraform installed 
3. export the AWS vars
```
     export AWS_ACCESS_KEY_ID="*****************"
     export AWS_SECRET_ACCESS_KEY="****************************"
     export AWS_DEFAULT_REGION="<your_region>"
```

Once cloned, initiate the terraform repo by issuing **terraform init** command from the home directory of the repo. 
```
terraform init
```

Then issue the **terraform plan** command to see what changes the workflow will bring in. 
```
terraform plan
```

To apply the changes, issue **terraform apply** command. 
``` 
terraform apply
```

This will create all the necessary infrastructure and the website can be accessed using the public ip/ public dns of the server
