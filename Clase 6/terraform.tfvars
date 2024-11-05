virginia_cidr = "10.10.0.0/16"

subnets = [ "10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]

tags = {
  "env" = "dev"
  "owner" = "gianpc"
  "cloud" = "AWS"
  "IAC" = "Terraform"
  "IAC_Version" = "1.9.8"
}

sg_ingress_cidr = "0.0.0.0/0"