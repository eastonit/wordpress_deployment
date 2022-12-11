## Evolving Wordpress - EC2

Deploy WordPress using Terraform to a single EC2 instance.

# First Time Deployment - MUST READ

In order to use this terraform code, you will need to create all the backend services to manage terraform state file. However, this is a chicken and egg situation as you need to have the state file managed somehow in order to run terraform, and create the remote backend AWS resources needed to manage the state file. 
So for first time deployment, complete the following steps:

1. Navigate to backend.tf and comment out lines 3 to 13 inclusive.
2. Assuming you have your AWS credentials configured, run terraform init to initialise the repository.

Once this completes succesfully, you now have a local state file managing your state. To migrate to remote state management continue...

3. Update the backend.tf file by uncommenting lines 3 to 13 included.
4. Run a terraform init. You will get a message "Do you want to copy existing state to the new backend?". Type yes
5. Run a terraform plan to confirn your state file has been migrated to a remote state file in S3 and locks are managed by DynamoDB

# Next Steps

