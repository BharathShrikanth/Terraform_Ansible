output "sg_id" {
   description = "ID of the security group"
   value       = aws_security_group.allow_tls.id
}
