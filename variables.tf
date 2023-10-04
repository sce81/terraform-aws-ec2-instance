variable "ami_id" {}
variable "key_name" {
  type        = string
  description = "AWS Hosted SSH key to issue to EKS Worker"
}
variable "user_data" {}
variable "env_name" {
  type        = string
  description = "Name of environment for tagging purposes"
}
variable "vpc_name" {
  type        = string
  description = "Identifier of VPC to pass into data source"
}
variable "name" {
  type        = string
  description = "Name of EC2 Instance for tagging purposes"
}
variable "subnet_name" {
  type        = string
  description = "name identifier of vpc subnets to use for EC2 deployment"
  default     = "private"
}
//variable "instance_profile"                               {}
variable "number" { default = 00 }
variable "instance_type" {
  type        = string
  description = "EC2 Instance size of EKS Workers"
  default     = "m5.large"
}
variable "disable_api_termination" { default = "false" }
variable "project" { default = "shared" }
variable "source_dest_check" { default = true }

variable "extra_tags" {
  type    = map(any)
  default = {}
}
variable "enable_eip" {
  default = 0
}
variable "customer_owned_ipv4_pool" { default = null }
variable "iam_role_policy" { default = {} }
variable "managed_iam_policy" {
  default = []
  type    = list(string)
}
variable "enable_ssm" {
  default = true
  type    = bool
}
variable "ingress_rules" {
  description = "map of security group rules for ec2 instances"
  type = map(object({
    from_port   = optional(string)
    to_port     = optional(string)
    protocol    = optional(string)
    type        = optional(string)
    description = optional(string)
    cidr_blocks = optional(list(string))
  }))
  default = {}
}