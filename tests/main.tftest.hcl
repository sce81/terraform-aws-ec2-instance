
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

variables {
  ami_id = "ami-090f43bfef67db145"
  instance_type = "t2.micro"
  disable_api_termination = true
  key_name = "demo-public-eks-ssh-key"
  user_data = "echo 'Hello, world!'"
  env_name = "test"
  number = 0
  vpc_name = "vpc-123456"
  name = "test-instance"
  subnet_name = "subnet-123456"
  enable_ssm = true
  subnet_ids         = ["subnet-0c2a66fd6e03e4789"]
  security_group_ids = ["sg-0bc80596b878aea86"]
  extra_tags = {
    "Extra" = "Tag"
  }
  egress_protocol = "-1"
  egress_from_port = 0
  egress_to_port = 0
}

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

  #assert {
  #  condition     = aws_iam_instance_profile.main.id != null
  #  error_message = "IAM instance profile ID should not be null"
  #}

  #assert {
  #  condition     = aws_iam_role.main.id != null
  #  error_message = "IAM role ID should not be null"
  #}

  assert {
    condition     = aws_security_group.main.id != null
    error_message = "Security group ID should not be null"
  }
}