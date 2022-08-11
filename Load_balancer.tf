resource "aws_lb" "mybalancer" {
  name = "mybalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups   = [aws_security_group.mysg.id]
  subnets            = [aws_subnet.public-subnet.id,aws_subnet.private_subnet.id]
  enable_deletion_protection = true
  tags = {
    name = "mybalancer"
  } 
}


resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.mybalancer.arn
  port = "80"
    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytargetgroup.arn
  }

  
}





resource "aws_lb_target_group" "mytargetgroup" {
  health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2


  }
  name = "mytargetgroup"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = aws_vpc.main.id
  tags = {
    "name" = "mytargetgroup"
  }
}

resource "aws_lb_target_group_attachment" "myattachment" {
  target_group_arn = aws_lb_target_group.mytargetgroup.arn
  target_id        = aws_instance.public_instance.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "myattachment1" {
  target_group_arn = aws_lb_target_group.mytargetgroup.arn
  target_id        = aws_instance.private_instance.id
  port             = 80
}
