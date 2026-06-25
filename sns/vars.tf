variable "topic_name" {
  description = "The name of the SNS topic"
  type        = string
}
variable "email_endpoint" {
  description = "The email endpoint for the SNS subscription"
  type        = string
}
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "lambda_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
}
variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}