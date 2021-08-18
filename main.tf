resource "aws_instance" "main" {
  ami                                   = var.ami_id
  instance_type                         = var.instance_type
  disable_api_termination               = var.disable_api_termination 
  key_name                              = var.key_name
  user_data                             = var.user_data
  iam_instance_profile                  = var.instance_profile

  network_interface {
    network_interface_id                = aws_network_interface.main.id
    device_index                        = 0
  }

  tags = merge(
        local.common_tags, var.extra_tags,
        tomap({
            Name = "${var.env}-${var.project}-${var.name}-${var.number}"
        })
    )

  lifecycle {
    ignore_changes                     = [user_data]
  }
}

resource "aws_network_interface" "main" {
  subnet_id                             = element(var.subnet_ids, var.number)
  security_groups                       = var.security_group_ids
  source_dest_check                     = var.source_dest_check
  
  tags = merge(
        local.common_tags, var.extra_tags,
        tomap({
            Name = "${var.env}-${var.project}-${var.name}-${var.number}"
        })
    )

}

resource "aws_eip" "public" {
  vpc                                   = true
  customer_owned_ipv4_pool              = var.customer_owned_ipv4_pool
  network_interface                     = aws_network_interface.main.id

  tags = merge(
        local.common_tags, var.extra_tags,
        tomap({
            Name = "${var.env}-${var.project}-${var.name}-eip-${var.number}"
        })
    )
  depends_on = [
    aws_instance.main
  ]
}
