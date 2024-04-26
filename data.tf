locals {
  common_tags = {

    "Name"        = "${var.name}-${var.env}"
    "Environment" = var.env
    "Terraform"   = "true"
  }
}

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  filter {
    name   = "tag:Name"
    values = ["*-${var.subnet_name}*"]
  }
}
