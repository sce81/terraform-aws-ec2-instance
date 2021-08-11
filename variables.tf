variable "ami_id"                                         {}
variable "key_name"                                       {}
variable "user_data"                                      {}
variable "env"                                            {}
variable "name"                                           {}
variable "subnet_ids"                                     {type = list}
variable "instance_profile"                               {}
variable "number"                                         {default  = 00}
variable "instance_type"                                  {default  = "m5.large"}
variable "disable_api_termination"                        {default  = "true"}
variable "project"                                        {default  = "shared"}
variable "source_dest_check"                              {default  = true}
variable "security_group_ids"                             {type     = list}
variable "extra_tags"                                     {
                                                          type = map
                                                          default = {}
                                                          }
variable "enable_eip"                                     {
                                                            default = 0 
                                                          }
variable "customer_owned_ipv4_pool"                       {default = null}