

//output "private_eni" {
//  value = aws_network_interface.main.id
//}
//
//output "private_ip" {
//  value = aws_network_interface.main.private_ips
//}

output "role_name" {
  value = aws_iam_role.main.name
}

output "role_arn" {
  value = aws_iam_role.main.arn
}
output "instance_id" {
  value = aws_instance.main.id
}
