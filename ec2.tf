data "aws_ami" "ami" {
    most_recent = true
    owners = ["973714476881"]
  }
data "aws_security_group" "alloall"{
  name = "alloall"
  }
variable "instance_type" {
  default = "t3.micro"
}
variable "components" {
  default = ["frontend","magodb","catalog"]
}
resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.alloall.id]
  tags = {
    Name = var.components[count.index]
  }
  }


output "servername" {
value = aws_instance.instance.public_dns
