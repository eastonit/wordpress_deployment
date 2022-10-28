resource "aws_instance" "wp_instance" {
  ami           = "ami-0648ea225c13e0729"
  instance_type = "t2.micro"
  user_data     = "./scripts/userdata.txt"

}
