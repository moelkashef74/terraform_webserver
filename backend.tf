terraform {
  backend "s3" {
    bucket = "terraform-state-s3-bucket-654654522276-us-east-1-an"
    key    = "path/to/my/terraform.tfstate"
    region = "us-east-1"
  }
}