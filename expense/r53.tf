resource "aws_route53_record" "expense" {
    count = 3
    zone_id = "Z08507192LTGIE6IND07Q"
    name = " ${var.instance_name[count.index]}.devgani.online"
    type = "A"
    ttl = 1
    records = [aws_instance.expense[count.index].private_ip]
    allow_overwrite = true

}