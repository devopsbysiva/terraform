locals {
    
    instance_type = var.envirnoment == "mysql" ? "t3.small" : "t3.micro"
}
