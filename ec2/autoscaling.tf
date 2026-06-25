resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 4
  max_size             = 6
  min_size             = 2
  vpc_zone_identifier  = var.public_subnet_ids
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  target_group_arns    = [aws_alb_target_group.web_tg.arn]
}