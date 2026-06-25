resource "aws_sns_topic" "s3-upload-notifier" {
  name = var.topic_name
}
resource "aws_sns_topic_subscription" "notifier-subscription" {
  topic_arn = aws_sns_topic.s3-upload-notifier.arn
  protocol  = "email"
  endpoint  = var.email_endpoint
}
