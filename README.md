# terraform-aws-ec2-instance
### All code is provided for reference purposes only and is used entirely at own risk. Code is for use in development environments only. Not intended for Production use.
Terraform module for creating a standalone EC2 instance with IAM and Security Groups.  
Includes example Terraform Testing Framework



## Usage

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
To execute terraform test, run `terraform init` from within the root folder and `terraform test *.tfvars` specifically referencing the tfvars for for use.
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

#### Terraform Cloud Testing
To test against Terraform Cloud the following test command should be executed  
`terraform test -cloud-run=app.terraform.io/:ORG/:MODULE_NAME/:PROVIDER`  

NB: Module should be configured to use Branch based module publishing, or testing within TFC will not be supported.  


### Prerequisites

Terraform ~> 1.6.0

### Tested

Terraform ~> 1.6.0

### Outputs

instance_id: value = aws_instance.main.id
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.7 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_eip.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.managed-AmazonEC2RoleforSSM](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnets.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID of image to use | `string` | n/a | yes |
| <a name="input_customer_owned_ipv4_pool"></a> [customer\_owned\_ipv4\_pool](#input\_customer\_owned\_ipv4\_pool) | n/a | `any` | `null` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | automatically dlete root device when instance is destroyed | `bool` | `true` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Disable API Termination to prevent accidental deletion | `bool` | `true` | no |
| <a name="input_egress_from_port"></a> [egress\_from\_port](#input\_egress\_from\_port) | restrict egress to specific port range, deaults to any | `number` | `0` | no |
| <a name="input_egress_protocol"></a> [egress\_protocol](#input\_egress\_protocol) | restrict egress to specific protocol, deaults to any | `string` | `"-1"` | no |
| <a name="input_egress_to_port"></a> [egress\_to\_port](#input\_egress\_to\_port) | restrict egress to specific port range, deaults to any | `number` | `0` | no |
| <a name="input_enable_eip"></a> [enable\_eip](#input\_enable\_eip) | n/a | `number` | `0` | no |
| <a name="input_enable_ssm"></a> [enable\_ssm](#input\_enable\_ssm) | enable SSM for Worker Nodes | `bool` | `true` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Name of environment for tagging purposes | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_iam_role_policy"></a> [iam\_role\_policy](#input\_iam\_role\_policy) | n/a | `map` | `{}` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | map of security group rules for eks nodes | <pre>map(object({<br/>    from_port   = optional(string)<br/>    to_port     = optional(string)<br/>    protocol    = optional(string)<br/>    type        = optional(string)<br/>    description = optional(string)<br/>    cidr_blocks = optional(list(string))<br/>  }))</pre> | `{}` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 Instance compute class | `string` | `"t3.large"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of AWS Managed SSH Key to use | `string` | n/a | yes |
| <a name="input_managed_iam_policy"></a> [managed\_iam\_policy](#input\_managed\_iam\_policy) | n/a | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of EC2 Instance for tagging purposes | `string` | n/a | yes |
| <a name="input_number"></a> [number](#input\_number) | Instance number in scenario of multiple | `number` | `0` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | addional security group IDs to pass to instance security group | `list(any)` | `[]` | no |
| <a name="input_source_dest_check"></a> [source\_dest\_check](#input\_source\_dest\_check) | restrict egress to specific port range, deaults to any | `bool` | `true` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | name identifier of vpc subnets to use for EKS worker deployment | `string` | `"private"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Userdata to execute on first instance startup | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | size of EBS root volume | `number` | `8` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | EBS Volume type | `string` | `"gp3"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Identifier of VPC to pass into data source | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
<!-- END_TF_DOCS -->
