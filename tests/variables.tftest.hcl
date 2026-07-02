
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "variable_validation" {
  assert {
    condition     = var.ami_id != null
    error_message = "AMI ID should not be null"
  }

  assert {
    condition     = var.instance_type != null
    error_message = "Instance type should not be null"
  }

  assert {
    condition     = var.key_name != null
    error_message = "Key name should not be null"
  }

  assert {
    condition     = var.user_data != null
    error_message = "User data should not be null"
  }

  assert {
    condition     = var.env_name != null
    error_message = "Environment name should not be null"
  }

  assert {
    condition     = var.number != null
    error_message = "Number should not be null"
  }

  assert {
    condition     = var.vpc_name != null
    error_message = "VPC name should not be null"
  }

  assert {
    condition     = var.name != null
    error_message = "Name should not be null"
  }

  assert {
    condition     = var.subnet_name != null
    error_message = "Subnet name should not be null"
  }

  assert {
    condition     = var.enable_ssm != null
    error_message = "Enable SSM should not be null"
  }

  assert {
    condition     = var.egress_protocol != null
    error_message = "Egress protocol should not be null"
  }

  assert {
    condition     = var.egress_from_port != null
    error_message = "Egress from port should not be null"
  }

  assert {
    condition     = var.egress_to_port != null
    error_message = "Egress to port should not be null"
  }
}