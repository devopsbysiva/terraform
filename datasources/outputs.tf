output "instance_info" {
  value = aws_instance.expense
}

output "ami-info" {
  value = data.aws_ami.ami_info.id
}

output "r53_info" {
  value = data.aws_route53_zone.expense
}