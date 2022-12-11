locals {
  vpc_cidr               = "10.10.0.0/16"
  public_subnet_1_cidr   = "10.10.10.0/24"
  public_subnet_2_cidr   = "10.10.20.0/24"
  public_subnet_3_cidr   = "10.10.30.0/24"
  private_subnet_1_cidr  = "10.10.40.0/24"
  private_subnet_2_cidr  = "10.10.50.0/24"
  private_subnet_3_cidr  = "10.10.60.0/24"
  project_title          = "evolving-wordpress"
  project_name           = "ew"
  project_infrastructure = "ec2"
  company                = "eit"

  tags = {
    "Name"                   = var.project_name
    "Project Code"           = var.project_code
    "Project infrastructure" = var.project_infrastructure
  }
}
