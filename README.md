# terraform-aws-ec2-instance
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use.
Terraform module for creating a standalone EC2 instance with IAM and Security Groups.  
Includes example Terraform Testing Framework




##### Usage


    module "instance" {
      source               = "git@github.com:sce81/terraform-aws-ec2-instance.git"
      name                 = var.env
      env_name             = var.name
      project              = var.project
      vpc_name             = var.vpc_name
      subnet_name          = var.subnet_name
      ami_id               = var.ami_id
      key_name             = module.ssh_key.key_name
      security_group_ids   = [module.instance-sg.id]
      user_data            = data.template_file.userdata.rendered
    }


## Terraform Test
To execute `terraform test`, module requires a `*.tfvars` file for populating module configuration for test environment. Example below.  
To execute terraform test, run `terraform init` from within the root folder and terraform test *.tfvars
NB: terraform test will deploy live resources to cloud environment.

    env_name               = "terraform"
    name                   = "test-framework"
    instance_type          = "t3.micro"
    vpc_name               = "demo-public-vpc"
    subnet_name            = "private"
    ami_id                 = "ami-01234567890"
    key_name               = "testing-ssh-key"
    subnet_ids             = ["subnet-1234567890"]
    user_data              = "echo 'Hello, world!'"
    security_group_ids     = ["sg-1234567890"]

Testing requires minimun Terraform version 1.6.0
Testing also requires a provider.tf file to be created within the module. Omitted to prevent conflicts at root level. 


    provider "aws" {
      region = "eu-west-1"
    }

### Prerequisites

Terraform ~> 1.6.0

### Tested

Terraform ~> 1.6.0

### Outputs

instance_id: value = aws_instance.main.id
