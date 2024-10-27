resource "aws_instance" "terraform" {
    for_each = var.instance_name
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids =[aws_security_group.allow_ssh_terraform.id]
    instance_type = each.value
    tags = {
        Name = each.key
    }

}

resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_t"
    description = "Terraform"
    
    ingress {   #incoming traffic.
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    egress {  #outgoing traffic
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    
    tags = {
        Name = "allow_ssh_tera"
  }
  
}