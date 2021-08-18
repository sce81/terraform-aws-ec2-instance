
output "private_eni" {
    value = aws_network_interface.main.id
}

output "private_ip" {
    value = aws_network_interface.main.private_ips
}
output "instance_id" {
    value = aws_instance.main.id
}
