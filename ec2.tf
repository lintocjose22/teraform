resource "aws_instance" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "linto"
  }
}
output "instance_ip_addr" {
  value = aws_instance.frontend.public_ip
}
