variable "instance_name" {
    type = map
    default = {
        frontend = "t3.micro"  # key = value
        backend = "t3.micro"
        mysql = "t3.small"
    }

}
