resource "aws_security_group" "rdp_sg" {
  name        = "windows-rdp-sg"
  description = "Allow RDP access"
  vpc_id = data.aws_vpc.existing.id


  ingress {
    description = "RDP from my IP"
    from_port   = 3389
    to_port     = 3389
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
    Name = "windows-rdp-sg"
  }
}
