locals {
  common_tags = {
    "Name"        = "${var.env_name}-${var.project}-${var.name}"
    "Environment" = var.env_name
    "Project"     = var.project
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
    values = ["*-${var.subnet_name}-*"]
  }
}