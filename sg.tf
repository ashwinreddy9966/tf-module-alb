# Public LB SG
resource "aws_security_group" "alb_public" {
  name        = "roboshop-public-alb-${var.ENV}"
  description = "roboshop-public-alb-${var.ENV}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "Allows http Port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name =  "roboshop-public-alb-${var.ENV}"
  }
}

# Private LB SG
resource "aws_security_group" "alb_private" {
  name        = "roboshop-private-alb-${var.ENV}"
  description = "roboshop-private-alb-${var.ENV}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "Allows http Port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name =  "roboshop-private-alb-${var.ENV}"
  }
}
