locals {
      instance_type = [
    for env in var.envirnoment :
    env == "backend" ? "t8.small" : "t3.micro"
  ]
}
