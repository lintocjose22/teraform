data "aws_ami" "ami" {
    most_recent = true
    owners = ["973714476881"]
  }
data "aws_security_group" "alloall"{
  name = "alloall"
  }
//variable "instance_type" {
//  default = "t3.micro"
//}
variable "components" {
  default = {
    frontend= {
      name     = "frontend"
      instance_type = "t3.micro"
    }
    catalog= {
      name     = "catalog"
      instance_type = "t3.micro"
    }
    }
  }

resource "aws_instance" "instance" {
  for_each = var.components
  ami                    = data.aws_ami.ami.image_id
  instance_type          = each.value["instancetype"]
  vpc_security_group_ids = [data.aws_security_group.alloall.id]
  tags                   = {
   Name = each.value["name"]
    }
}

