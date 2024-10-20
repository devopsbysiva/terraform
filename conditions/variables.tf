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