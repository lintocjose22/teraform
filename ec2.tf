data "aws_ami" "example" {
    most_recent = true
    owners = ["973714476881"]
  }
data "aws_security_group" "alloall"{
  name = "alloall"
  }
variable "instance_type" {
  default = "t3.micro"
}
resource "aws_instance" "frontend" {
  ami           = data.aws_ami.example.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_group.alloall
  tags = {
    Name = "frontend"
  }
}
output "Frontend" {
  value = aws_instance.frontend.public_ip
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.example.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_group.alloall
    tags = {
    Name = "cart"
  }
}


output "instance_Cart" {
  value = aws_instance.cart.public_ip
}
