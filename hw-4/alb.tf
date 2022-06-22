
## Create ALB
resource "aws_lb" "alb-balancer" {
  name               = "alb-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_tls.id]
  subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id]
  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "production"
  }
}