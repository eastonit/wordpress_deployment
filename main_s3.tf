# # Create an S3 bucket to store the Terraform State File
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "eit-general-terraform-state"

#   lifecycle {
#     prevent_destroy = true
#   }

# }

# # Enable versioning on the Terraform State File bucket
# resource "aws_s3_bucket_versioning" "enabled" {
#   bucket = aws_s3_bucket.terraform_state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# # Enable Server Side Encryption for Terraform State File at rest
# resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
#   bucket = aws_s3_bucket.terraform_state.bucket

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }

# }

# # Block all public access to the Terraform State File S3 bucket
# resource "aws_s3_account_public_access_block" "public_access" {
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true

# }
