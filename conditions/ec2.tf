resource "aws_security_group" "terraform_sg" {
    name = "allow_all_ssh"
    description = "allow ssh protocal"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
 }

    ingress {
        from_port        = var.port
        to_port          = var.port
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
 }
    
    tags = var.tags
 }



resource "aws_instance" "terraform" {
  ami           = var.ami
  instance_type = var.envirnoment == "prod" ? "t3.micro" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  # tags = {
  #   Name = "terraform"
  # }

  tags = var.tags
  
}


