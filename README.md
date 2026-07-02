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

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

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
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | n/a | `any` | n/a | yes |
| <a name="input_customer_owned_ipv4_pool"></a> [customer\_owned\_ipv4\_pool](#input\_customer\_owned\_ipv4\_pool) | n/a | `any` | `null` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | n/a | `string` | `"true"` | no |
| <a name="input_enable_eip"></a> [enable\_eip](#input\_enable\_eip) | n/a | `number` | `0` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | n/a | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"m5.large"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_number"></a> [number](#input\_number) | n/a | `number` | `0` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `"shared"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_source_dest_check"></a> [source\_dest\_check](#input\_source\_dest\_check) | n/a | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
<!-- END_TF_DOCS -->
