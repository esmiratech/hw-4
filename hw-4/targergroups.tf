
### target group
resource "aws_lb_target_group" "alb-hw" {
  name        = "alb-target"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id = aws_default_vpc.vpc-esmira-default.id
}
### Attach EC2 target group

resource "aws_lb_target_group_attachment" "alb-hw1" {
  target_group_arn = aws_lb_target_group.alb-hw.arn
  target_id        = aws_instance.hw1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "alb-hw2" {
  target_group_arn = aws_lb_target_group.alb-hw.arn
  target_id        = aws_instance.hw2.id
  port             = 80
}


