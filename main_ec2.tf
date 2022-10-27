resource "aws_instance" "wp_instance" {
  ami               = "ami-0648ea225c13e0729"
  instance_type     = "t2.micro"
  availability_zone = "eu-west-2a"
  subnet_id         = aws_subnet.public_1_subnet
  user_data         = "./scripts/userdata.txt"

}

resource "aws_security_group" "wp_instance_security_group" {


}
