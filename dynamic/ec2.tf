resource "aws_instance" "terraform" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  instance_type          = "t2.micro"
  tags = {
    Name = "terraform"
  }

}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_ssh_t"
  description = "Terraform"

  dynamic "ingress" { #incoming traffic.
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }


  tags = {
    Name = "allow_ssh_tera"
  }
}
  