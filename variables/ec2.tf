resource "aws_security_group" "allow_ssh_terraform" {

  # ... other configuration ...
    name = "allow_sshh" #name of the security group.
    description = " allow port 22 for ssh connectivity." #this is optional.

    egress {  #outgoing traffic 
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {  #incoming traffic 
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "Allow_ssh_terra"  #display name in security group
    }
}

resource "aws_instance" "Terraform"{
    ami           = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = "terraform"
  }
}

