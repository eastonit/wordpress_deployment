resource "aws_instance" "wp_instance" {
  ami               = "ami-0648ea225c13e0729"
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = data.aws_subnet.public_subnet.id[0]
  user_data         = "./scripts/userdata.txt"

}
