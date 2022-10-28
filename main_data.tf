data "aws_region" "current" {

}

data "aws_availability_zones" "available" {
  state = "available"

}

data "aws_subnet" "public_subnet" {
  id = data.aws_availability_zones.available

}
