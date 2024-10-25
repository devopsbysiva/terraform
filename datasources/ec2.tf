resource "aws_instance" "expense" {
  count = length(var.instance_name)
  #name = "terraform"
  #description = "creating instance for expense project"

  ami                    = data.aws_ami.ami_info.image_id
  vpc_security_group_ids = [aws_security_group.terraform.id]
  instance_type          = var.instance_type

  tags = {
    Name = var.instance_name[count.index]
  }

}

resource "aws_security_group" "terraform" {

  name        = "allow_all_ssh"
  description = "allow ssh protocol"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }
  tags = {

    Name = "Terraform_ssh"
  }


}