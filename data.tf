locals {
  common_tags = {
    "Name"        = "${var.env}-${var.project}-${var.name}"
    "Environment" = var.env
    "Project"     = var.project
    "Terraform"   = "true"
  }

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

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}