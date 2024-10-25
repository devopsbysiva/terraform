resource "aws_route53_record" "expense" {
  count           = length(var.instance_name)
  zone_id         = data.aws_route53_zone.expense.zone_id
  name            = "${var.instance_name[count.index]}.${data.aws_route53_zone.expense.name}"
  type            = "A"
  ttl             = 1
  records         = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}