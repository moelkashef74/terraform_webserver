output "elb_dns_name" {
  value = aws_lb.web_alb.dns_name
}
output "ec2_public_ips" {
  value = aws_instance.web.*.public_ip
}