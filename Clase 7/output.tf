output "instance_1a_public_ip" {
  description = "IP pública de la instancia Instance_1a"
  value       = aws_instance.instance_1a.public_ip
}


output "instance_1b_public_ip" {
  description = "IP pública de la instancia Instance_1b"
  value       = aws_instance.instance_1b.public_ip
}
