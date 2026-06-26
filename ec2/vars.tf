# variable "user_data" {
#   description = "User data script to configure the EC2 instance"
#   type        = string
#   default     = <<-EOF
#               #!/bin/bash
#               apt update -y
#               apt install nginx -y
#               systemctl start nginx
#               systemctl enable nginx
#               echo "Hello from $(hostname)" > /var/www/html/index.html
#               EOF
# }

variable "vpc_id" {
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}
