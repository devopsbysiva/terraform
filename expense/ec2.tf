resource "aws_security_group" "allow_all_sshh"{
    name = "allow_sshh"
    description = "to allow ssh traffic"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_sshh"
    }
}

resource "aws_instance" "expense"{
    count=3
    ami = "ami-09c813fb71547fc4"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_sshh.id]

    tags = {
        Name = var.instance_name[count.index]
    }

}
