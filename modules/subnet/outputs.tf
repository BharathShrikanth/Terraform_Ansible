output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet_1.id
}
