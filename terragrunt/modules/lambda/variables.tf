variable "environment" {
  description = "environment"
  type        = string
}

variable "project" {
  description = "project name"
  type        = string
}

variable "handler" {
  description = "lambda function's handler"
  type        = string
  default     = "example::handler"
}

variable "memory_size" {
  description = "lambda functions memory size"
  type        = string
  default     = "512"
}

variable "runtime" {
  description = "lambda function's runtime"
  type        = string
  default     = "java8"
}

variable "timeout" {
  description = "lambda function's timeout"
  type        = string
  default     = "300"
}

variable "s3_bucket" {
  description = "s3_bucket for lambda"
  type        = string
}

variable "s3_key" {
  description = "s3 bucket object"
  type        = string
}

variable "s3_events" {
  description = "s3 events"
  type        = list(string)
  default     = ["s3:ObjectCreated:Put"]
}

variable "s3_filter_prefix" {
  description = "s3 bucket filter prefix"
  type        = string
  default     = "raw/"
}
