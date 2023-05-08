resource "aws_instance" "frontend" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "instance_ip_addr" {
  value = aws_instance.frontend.public_ip
}


resource "aws_instance" "cart" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "instance_ip_addr" {
  value = aws_instance.frontend.public_ip
}
