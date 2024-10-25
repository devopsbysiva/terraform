data "aws_ami" "ami_info" {

  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

data "aws_route53_zone" "expense" {
  name = "devgani.online"

}


# Used 2 data sources zoneid and amiid 
#by using datasource and filters we can all the data from the aws 