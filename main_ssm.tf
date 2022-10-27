resource "aws_ssm_parameter" "ssm_parameter_wp_database_name" {

  name        = "${var.project_name}_database_name"
  description = "Wordpress database name"
  type        = "String"
  value       = "${var.project_name}_database"
  overwrite   = true

}

resource "aws_ssm_parameter" "ssm_parameter_wp_database_username" {

  name        = "${var.project_name}_database_username"
  description = "Wordpress database username"
  type        = "SecureString"
  value       = "${var.project_name}_database_username"
  overwrite   = true

}

resource "aws_ssm_parameter" "ssm_parameter_wp_database_username_password" {

  name        = "${var.project_name}_database_username_password"
  description = "Wordpress database username password"
  type        = "SecureString"
  value       = "${var.project_name}_database_username_password"
  overwrite   = true

}

resource "aws_ssm_parameter" "ssm_parameter_wp_database_username_root_password" {

  name        = "${var.project_name}_database_username_root_password"
  description = "Wordpress database username root password"
  type        = "SecureString"
  value       = "${var.project_name}_database_username_root_password"
  overwrite   = true

}
