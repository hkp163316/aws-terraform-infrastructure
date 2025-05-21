resource "aws_elb" "web" {
  name               = "terraform-elb"
  subnets            = [var.subnet_id]
  security_groups    = [aws_security_group.elb_sg.id]
  instances          = [var.ec2_instance_id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  tags = {
    Name = "terraform-elb"
  }
}

resource "aws_security_group" "elb_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "elb-sg"
  }
}
