
#### Create ec2
resource "aws_instance" "hw1" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = <<EOF

  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  EOF
  subnet_id = aws_subnet.sub-a.id
  tags = {
    Name = "terraform_hw"
  }
}

resource "aws_instance" "hw2" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub-b.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name      = aws_key_pair.ssh.key_name
  user_data = <<EOF
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  EOF

  tags = {
    Name = "terraform_hw"
  }
}
