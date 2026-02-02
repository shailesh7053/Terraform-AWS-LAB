data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.vpc.outputs.vpc_id]
  }
}

  filter {
    name   = "tag:Name"
    values = ["public-subnet-1"]
  }
}
