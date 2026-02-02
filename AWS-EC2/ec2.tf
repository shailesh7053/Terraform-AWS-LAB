resource "aws_instance" "windows" {
  ami                    = data.aws_ami.windows.id
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnets.public.ids[0]
  vpc_security_group_ids = [aws_security_group.rdp_sg.id]

  key_name = "windows-key-new"

  associate_public_ip_address = true

  tags = {
    Name = "windows-rdp-server"
  }
}
