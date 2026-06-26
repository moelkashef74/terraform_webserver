module "network" {
  source           = "./network"
  vpc_cidr_block   = "10.0.0.0/16"
  region           = "us-east-1"
  pub_cidr_blocks  = ["10.0.1.0/24", "10.0.3.0/24"]
  priv_cidr_blocks = ["10.0.2.0/24", "10.0.4.0/24"]
  azs              = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source             = "./ec2"
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = [module.network.public_subnet_ids[0], module.network.public_subnet_ids[1]]
  private_subnet_ids = [module.network.private_subnet_ids[0], module.network.private_subnet_ids[1]]
  # user_data          = <<-EOF
  #                     #!/bin/bash
  #                     apt update -y
  #                     apt install nginx -y
  #                     systemctl start nginx
  #                     systemctl enable nginx
  #                     cat > /var/www/html/index.html <<'HTML'
  #                     ${file("${path.module}/index.html")}
  #                     HTML
  #                     EOF
}
# module "sns" {
#   source = "./sns"
#   topic_name          = "s3-upload-notifier"
#   email_endpoint      = "mhmdalsyd2015@gmail.com"
#   bucket_name         = "s3-upload-notifier-bucket"
#   lambda_role_name    = "s3-upload-lambda-role"
#   lambda_function_name = "s3-upload-lambda-function"
# }
output "elb_dns_name" {
  value = module.ec2.elb_dns_name
}

