###resource "aws_key_pair" "windows_key" {
  key_name   = "windows-key"
  public_key = file("./terraform-key.pub")
}###


resource "tls_private_key" "windows" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "windows" {
  key_name   = "windows-key"
  public_key = tls_private_key.windows.public_key_openssh
}
