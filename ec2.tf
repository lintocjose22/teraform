data "aws_ami" "example" {
    most_recent = true
    owners = ["973714476881"]
  }
output "aws_ami" {
  value =
}data.aws_ami.example.image_id

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.example.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "Frontend" {
  value = aws_instance.frontend.public_ip
}

resource "aws_instance" "cart" {
  ami           = "data.aws_ami.example.image_id"
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}
output "instance_Cart" {
  value = aws_instance.cart.public_ip
}
