# Set up the Terraform State file configuration

terraform {
  backend "s3" {
    bucket = "eit-general-terraform-state"
    key    = "wordpress-terraform-state.state"
    region = "eu-west-2"

    dynamodb_table = "eit-terraform-locks"
    encrypt        = true

  }
}

