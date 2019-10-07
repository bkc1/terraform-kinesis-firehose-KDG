resource "aws_cloudformation_stack" "KDG" {
  name         = "Kinesis-Data-Generator-Cognito-User-terraform-managed"
  capabilities = ["CAPABILITY_IAM"]
  parameters = {
    Username = "{var.kdg_username}"
    Password = "{var.kdg_password}"
  }
  template_url = "https://s3-us-west-2.amazonaws.com/kinesis-helpers/cognito-setup.json"
}

