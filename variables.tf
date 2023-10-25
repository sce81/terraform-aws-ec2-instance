
variable "ami_id" {
  type        = string
  description = "AMI ID of image to use"
}
variable "key_name" {
  type        = string
  description = "Name of AWS Managed SSH Key to use"
}
variable "user_data" {
  type        = string
  description = "Userdata to execute on first instance startup"
}

variable "env_name" {
  type        = string
  description = "Name of environment for tagging purposes"
}
variable "number" {
  type        = number
  description = "Instance number in scenario of multiple"
  default = 0
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

  description = "name identifier of vpc subnets to use for EKS worker deployment"
  default     = "private"
}
variable "enable_ssm" {
  type        = bool
  description = "enable SSM for Worker Nodes"
  default     = true
}
variable "instance_type" {
  type        = string
  description = "EC2 Instance compute class"
  default     = "t3.large"
}
variable "disable_api_termination" {
  type        = bool
  description = "Disable API Termination to prevent accidental deletion"
  default     = true
}

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

variable "ingress_rules" {
  description = "map of security group rules for eks nodes"
  type = map(object({
    from_port    = optional(string)
    to_port      = optional(string)
    protocol     = optional(string)
    type         = optional(string)
    description  = optional(string)
    cidr_blocks  = optional(list(string))
  }))
  default = {}
}


variable "security_group_ids" {
  default     = []
  description = "addional security group IDs to pass to instance"
  type        = list(any)
}

variable "volume_size" {
  default     = 8
  description = "size of EBS root volume"
  type        = number
}
variable "volume_type" {
  default     = "gp3"
  description = "EBS Volume type"
  type        = string
}
variable "delete_on_termination" {
  default     = true
  description = "automatically dlete root device when instance is destroyed"
  type        = bool
}
variable "egress_protocol" {
  default     = "-1"
  description = "restrict egress to specific protocol, deaults to any"
  type        = string
}
variable "egress_from_port" {
  default     = 0
  type        = number
  description = "restrict egress to specific port range, deaults to any"
}
variable "egress_to_port" {
  default     = 0
  type        = number
  description = "restrict egress to specific port range, deaults to any"
}