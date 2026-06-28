resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}