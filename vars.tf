variable "vpc_cidr_block" {
	description = "VPC CIDR block for the root network module"
	type        = string
}

variable "pub_cidr_blocks" {
	description = "Public subnet CIDR blocks for the network module"
	type        = list(string)
}

variable "priv_cidr_blocks" {
	description = "Private subnet CIDR blocks for the network module"
	type        = list(string)
}
