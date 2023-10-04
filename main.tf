resource "aws_instance" "main" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  disable_api_termination = var.disable_api_termination
  key_name                = var.key_name
  user_data               = var.user_data
  iam_instance_profile    = aws_iam_instance_profile.main.id
  vpc_security_group_ids  = [aws_security_group.main.id]

//  network_interface {
//    network_interface_id = aws_network_interface.main.id
//    device_index         = 0
//  }

  tags = merge(
    local.common_tags, var.extra_tags,
    tomap({
      Name = "${var.env_name}-${var.name}-${var.number}"
    })
  )

  lifecycle {
    ignore_changes = [user_data]
  }
}

//resource "aws_network_interface" "main" {
//  subnet_id = element(data.aws_subnets.main.ids, 0)
//  security_groups                       = [aws_security_group.main.id]
//  source_dest_check = var.source_dest_check
//
//  tags = merge(
//    local.common_tags, var.extra_tags,
//    tomap({
//      Name = "${var.env_name}-${var.name}-${var.number}"
//    })
//  )
//
//}

resource "aws_iam_instance_profile" "main" {
  name = "${var.env_name}_${var.name}_profile"
  role = aws_iam_role.main.name
}


resource "aws_iam_role" "main" {
  name               = "${var.env_name}_${var.name}_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "main" {
  count  = var.iam_role_policy == {} ? 0 : 1
  name   = "${var.env_name}_${var.name}_policy"
  policy = var.iam_role_policy
  role   = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "main" {
  count      = length(var.managed_iam_policy)
  role       = aws_iam_role.main.name
  policy_arn = element(var.managed_iam_policy, count.index)
}

resource "aws_iam_role_policy_attachment" "managed-AmazonEC2RoleforSSM" {
  count      = var.enable_ssm == true ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.main.name
}


resource "aws_security_group" "main" {
  name        = "${var.name}-${var.env_name}-sg"
  description = "Instance Security Group"
  vpc_id      = data.aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name}-${var.env_name}-sg"
    Environment = "${var.env_name}"
  }
}

resource "aws_security_group_rule" "main" {
  for_each = var.ingress_rules

  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  type              = each.value.type
  description       = each.key
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.main.id
}