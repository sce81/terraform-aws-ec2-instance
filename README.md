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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_iam_instance_profile.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
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
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Disable API Termination to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_enable_eip"></a> [enable\_eip](#input\_enable\_eip) | n/a | `bool` | `false` | no |
| <a name="input_enable_ssm"></a> [enable\_ssm](#input\_enable\_ssm) | enable SSM for Worker Nodes | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Name of environment for tagging purposes | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_iam_role_policy"></a> [iam\_role\_policy](#input\_iam\_role\_policy) | Optional inline IAM policy JSON to attach to the instance role. | `string` | `null` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | map of security group rules for eks nodes | <pre>map(object({<br/>    from_port   = optional(number)<br/>    to_port     = optional(number)<br/>    protocol    = optional(string)<br/>    type        = optional(string)<br/>    description = optional(string)<br/>    cidr_blocks = optional(list(string))<br/>  }))</pre> | `{}` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 Instance compute class | `string` | `"t3.large"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of AWS Managed SSH Key to use | `string` | n/a | yes |
| <a name="input_managed_iam_policy"></a> [managed\_iam\_policy](#input\_managed\_iam\_policy) | n/a | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of EC2 Instance for tagging purposes | `string` | n/a | yes |
| <a name="input_number"></a> [number](#input\_number) | Instance number in scenario of multiple | `number` | `0` | no |
| <a name="input_source_dest_check"></a> [source\_dest\_check](#input\_source\_dest\_check) | Whether source/destination checks are enabled on the primary network interface. | `bool` | `true` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | name identifier of vpc subnets to use for EKS worker deployment | `string` | `"private"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Userdata to execute on first instance startup | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Identifier of VPC to pass into data source | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | n/a |
<!-- END_TF_DOCS -->
