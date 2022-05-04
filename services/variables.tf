variable "aws_region" {

  type = string

  description = "AWS region"

}

variable "aws_profile" {
  type = string

  description = "AWS Configuration file profile"
}

variable "aws_ec2_image" {
  type = string

  description = "AWS EC2 Instance Image"
}

variable "aws_ec2_type" {
  type = string

  description = "AWS EC2 Instance type"
}

variable "aws_ec2_tags" {
  type = map(string)

  description = "AWS EC2 Instance tas"
}
