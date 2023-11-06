
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

#variables {
#  common_tags = {
#    "Name"        = "test"
#    "Environment" = "testing"
#    "Terraform"   = "true"
#  }
#  vpc_name    = "demo-public-vpc"
#  subnet_name = "private-az"
#}

run "data_validation" {
  assert {
    condition     = data.aws_vpc.main.id != null
    error_message = "VPC ID should not be null"
  }

  assert {
    condition     = length(data.aws_subnets.main.ids) > 0
    error_message = "Subnets should not be empty"
  }
}