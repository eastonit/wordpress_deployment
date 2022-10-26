# Set up the Terraform State file configuration

# terraform {
#   backend "s3" {
#     bucket = "eit-terraform-state"
#     key    = "wordpress-terraform-state.state"
#     region = "eu-west-2"

#     dynamodb_table = "eit-terraform-locks"
#     encrypt        = true

#   }
# }

# Create an S3 bucket to store the Terraform State File
resource "aws_s3_bucket" "terraform_state" {
  bucket = "eit-terraform-state"

  lifecycle {
    prevent_destroy = true
  }

}

# Enable versioning on the Terraform State File bucket
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Server Side Encryption for Terraform State File at rest
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

}

# Block all public access to the Terraform State File S3 bucket
resource "aws_s3_account_public_access_block" "public_access" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

# Provision a DynamoDB Table so register styate file locks during Terraform runs
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "eit-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}
