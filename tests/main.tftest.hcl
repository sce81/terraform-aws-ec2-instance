
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.


run "resource_validation" {
  assert {
    condition     = aws_instance.main.id != null
    error_message = "Instance ID should not be null"
  }

  assert {
    condition     = aws_network_interface.main.id != null
    error_message = "Network interface ID should not be null"
  }

  assert {
    condition     = aws_eip.public.id != null
    error_message = "EIP ID should not be null"
  }

  assert {
    condition     = aws_iam_instance_profile.main.id != null
    error_message = "IAM instance profile ID should not be null"
  }

  assert {
    condition     = aws_iam_role.main.id != null
    error_message = "IAM role ID should not be null"
  }

  assert {
    condition     = aws_security_group.main.id != null
    error_message = "Security group ID should not be null"
  }
}