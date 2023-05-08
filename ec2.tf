data "aws_ami" "example"
{
  owners = ["506664043528"]
  }
output "aws_ami" {
  value = data.aws_ami.example.image_id
}

resource "aws_instance" "frontend" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "Frontend" {
  value = aws_instance.frontend.public_ip
}

resource "aws_instance" "cart" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}
output "instance_Cart" {
  value = aws_instance.cart.public_ip
}
