resource "aws_key_pair" "windows_key" {
  key_name   = "windows-key"
  public_key = file("./terraform-key.pub")
}
