module "lambda" {
  source = "git::https://github.com/ozbillwang/terraform-aws-lambda.git?ref=v2.1.0"

  function_name = "${var.project}-${var.environment}"
  description   = "${var.project}-${var.environment}"
  handler       = var.handler
  memory_size   = var.memory_size
  runtime       = var.runtime
  timeout       = var.timeout

  // Specify a zip file on s3_bucket
  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key

  // Add environment variables.
  environment = {
    variables = {
      environment = var.environment
    }
  }

  tags = {
    environment = var.environment
    terraform   = "true"
  }
}

data "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.function_arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.bucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.s3_bucket

  lambda_function {
    lambda_function_arn = module.lambda.function_arn
    events              = var.s3_events
    filter_prefix       = var.s3_filter_prefix
  }
}
