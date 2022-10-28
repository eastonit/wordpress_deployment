resource "aws_instance" "wp_instance" {
  ami           = "ami-0648ea225c13e0729"
  instance_type = "t2.micro"
  subnet_id     = aws.subnet_id.public_1_subnet
  user_data     = "./scripts/userdata.txt"

}
