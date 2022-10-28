# Provision a DynamoDB Table so register styate file locks during Terraform runs
# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "eit-terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }

# }
