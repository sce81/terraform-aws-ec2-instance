# tf-module-network-appliance
Terraform module for creating a single EC2 instance - eg: a self managed Elasticsearch node.  
Static ENI and optional EIP to allow for EC2 upgrades without changing the IP address.  
Expects security groups and IAM roles to be created externally to the module.  


##### Usage

    module "paloalto" {
      source                                        = "git@github.com:sce81/tf-module-ec2-instance.git"
      count                                         = 1
      number                                        = (count.index + 1)
      env                                           = var.env
      name                                          = var.name
      project                                       = var.project
      subnet_ids                                    = data.terraform_remote_state.infra.outputs.primary_subnet_ids
      ami_id                                        = var.ami_id
      key_name                                      = module.ssh_key.key_name
      security_group_ids                            = [module.pa-sg-pub.id]
      user_data                                     = data.template_file.userdata.rendered
      instance_profile                              = module.pa-iam.instance_profile
    }
