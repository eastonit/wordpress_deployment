resource "aws_instance" "wordpress_instance" {
  ami             = "ami-04706e771f950937f"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.public_sg.id]
  subnet_id       = aws_subnet.public_1_subnet.id
  tags = {
    "Name" = "Wordpress Instance"
  }

}
