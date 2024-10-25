variable "instance_name" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]

}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# variable "ami_id"{
#     type = string
#     default = "ami-09c813fb71547fc4f"
# }

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  type    = list(string)
  default = ["::/0"]
}