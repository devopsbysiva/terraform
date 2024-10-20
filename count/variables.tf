variable envirnoment {
  type        = string
  default     = "dev"
}

variable "ami" {
  type = string
  default= "ami-09c813fb71547fc4f"
}

variable "port" {
  type = number
  default = 22
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  type = list(string)
  default = ["::/0"]
}

variable "tags" {
  type = map
  default = { 
    name = "terraform"
    
    }
}

variable "instance_name" {
  type = list(string)
  default = ["mysql","backend","frontend"]
}

variable "common_tags" {
  type = map
  default = {
    project = "expense"
    envirnoment = "dev"
    terraform = "true"
  }
}