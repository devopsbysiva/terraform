
variable "name"{
    default = "allow_sshh"
    type = string
}

variable "description"{
    default = "allow port 22 for ssh connectivity."
    type = string
}

variable "from_port"{
    default = 22
    type = number
}

variable "to_port"{
    default = 22
    type = number
}

variable "protocol"{
    default = "tcp"
    type = string
}

variable "cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "tags"{
    type = map
    default = {  #this is a map whatever possible we can declare here.
        Name = "Allow_ssh_terra"
        project = "Testing_terraform"
        module = "main server"
        Environment = "practice"
        Terraform = "true"
    }
}

variable "ami"{
    type = string
    default = "ami-09c813fb71547fc4f"
}

# variable "instance_type"{
#     type = string
#     default = "t2.micro"   
# }