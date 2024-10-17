resource "aws_security_group" "allow_ssh_terraform" {

  # ... other configuration ...
    name = var.name #name of the security group.
    description = var.description #this is optional.

    egress {  #outgoing traffic 
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {  #incoming traffic 
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags

    # tags = {
    #     Name = "Allow_ssh_terra"  #display name in security group
    # }
}

resource "aws_instance" "Terraform"{
    ami           = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = "terraform"
  }
}

