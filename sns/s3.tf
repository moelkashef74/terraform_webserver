resource "aws_s3_bucket" "file_uploader" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.file_uploader.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_upload_handler.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
resource "aws_lambda_permission" "allow_s3_to_invoke_lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_upload_handler.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.file_uploader.arn
}
