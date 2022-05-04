
provider "aws" {
  region = var.aws_region

  profile = var.aws_profile
}

resource "aws_instance" "ec2_instance" {
  ami           = var.aws_ec2_image
  instance_type = var.aws_ec2_type

  key_name = var.aws_key_name

  tags = var.aws_ec2_tags
}
