data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-state-shailesh-prod"
    key    = "vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}
