variable "vpc_cidr_block" {
  type        = string
}
variable "region" {
  type        = string
}
variable "pub_cidr_blocks" {
  type        = list(string)
}
variable "azs" {
  type        = list(string)
}
variable "priv_cidr_blocks" {
  type        = list(string)
}