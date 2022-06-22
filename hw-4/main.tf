




#### Keypair add

resource "aws_key_pair" "ssh" {
  key_name   = "ssh_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCp8D/IBkK+lj5LT3UB9RyZpL5Ccul90X3qjztCZ8Ni09iTIsnixRJnM5GMJwlDc9DltxozYNssS8GXm4y/acvG2SWO0/rC/f+aF79IPncmuOZAMUV75yc+QZWGoR4OJdOsCD1xJb/NnZskfcZLenOW3kEF/TF8C35J+KDWVw/yipEMQ+oXFBz1bi6VXfARgQFLbHKKKAp49iNdXJ+Xt0n29q6M4mdYQ8XnqrIFF3NAbftZLUAvdCDWlJz/BUSavjJMgGxFrNWqGL41Pc9FI+10BYxdIMHHSlhqrmASNALnJhDQOf/H6Pt5S1zgo7A8jLFpM4aGyeVeMFdMbYM60aR7RLVtjf5a1OC0ra5KYbSLA+9pu50k4H0DDnXEIUvFbvNfniExVuWAzdqPVOXHvrvui240YQzo9MMkLeQS2ULGqLV+wCGuxUtkjTwfWfj+QQrQqct4YdfUCincf0SRCJ/sGLCICXRH5J4x0twYDxl9O85CwmDCC4GD5t6HTi7+Ncc= elshanbairamov@MacBook-Pro.local"
}

#### adding security group
resource "aws_security_group" "allow_tls" {
  name        = "ec2_sghw"
  description = "Allow http"
  

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "apache"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform-ec2sg"
  }
}


#### adding security group load balancer
resource "aws_security_group" "alb_tls" {
  name        = "alb_sghw"
  description = "ALB traffic to the world over port 443 "
  

  ingress {
    description      = "allow all traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "world to http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform-alb-sg"
  }
}

#### vpc
# resource "aws_vpc" "terra_vpc" {
#   cidr_block = "10.0.0.0/16"
# }

resource "aws_default_vpc" "vpc-esmira-default" {
  tags = {
    Name = "Default VPC"
  }
}
