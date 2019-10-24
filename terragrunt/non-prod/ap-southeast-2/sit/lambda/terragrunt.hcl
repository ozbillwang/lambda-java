# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "${path_relative_from_include()}/../modules/lambda"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  project = "lambda-s3"
  environment = "sit"

  s3_bucket = "123456789012-lambda-assets"
  s3_key    = "libs/lamda-1.0-SNAPSHOT.zip"

}

