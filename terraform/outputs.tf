output "vpc_id" {
  value = aws_vpc.project_vpc.id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
  value = aws_subnet.private_subnet_2.id
}

output "web_sg" {
  value = aws_security_group.web_sg.id
}

output "db_sg" {
  value = aws_security_group.db_sg.id
}

