resource "aws_instance" "windows" {
  ami           = data.aws_ami.windows.id
  instance_type = "t3.micro"

  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]

  vpc_security_group_ids = [
    aws_security_group.rdp_sg.id
  ]

  key_name = aws_key_pair.windows.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
<powershell>
# Enable RDP
Set-ItemProperty -Path "HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server" `
  -Name "fDenyTSConnections" -Value 0

# Disable Network Level Authentication (NLA)
Set-ItemProperty -Path "HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp" `
  -Name "UserAuthentication" -Value 0

# Enable Windows Firewall rules for RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Ensure RDP service is running
Set-Service -Name TermService -StartupType Automatic
Restart-Service -Name TermService
</powershell>
EOF

  tags = {
    Name = "windows-rdp-server"
  }
}
