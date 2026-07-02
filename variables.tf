
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

variable "env" {
  type        = string
  description = "Name of environment for tagging purposes"
}
variable "number" {
  type        = number
  description = "Instance number in scenario of multiple"
  default     = 0
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
  type = string

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
  default     = false
}

variable "extra_tags" {
  type    = map(any)
  default = {}
}
variable "enable_eip" {
  type    = bool
  default = false
}
variable "customer_owned_ipv4_pool" { default = null }
variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination checks are enabled on the primary network interface."
  default     = true
}
variable "iam_role_policy" {
  type        = string
  description = "Optional inline IAM policy JSON to attach to the instance role."
  default     = null
}
variable "managed_iam_policy" {
  default = []
  type    = list(string)
}

variable "ingress_rules" {
  description = "map of security group rules for eks nodes"
  type = map(object({
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string)
    type        = optional(string)
    description = optional(string)
    cidr_blocks = optional(list(string))
  }))
  default = {}
}
