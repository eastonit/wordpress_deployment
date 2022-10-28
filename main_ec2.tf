resource "aws_instance" "wp_instance" {
  ami               = "ami-0648ea225c13e0729"
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = aws_subnet.public_1_subnet.id
  user_data         = "./scripts/userdata.txt"

}
