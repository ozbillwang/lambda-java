# Configure Terragrunt to automatically store tfstate files in an S3 bucket
# test
remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "${get_aws_account_id()}-tf-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = {}
