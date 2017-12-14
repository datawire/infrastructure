// file: main.tf

provider "aws" {
    region = "us-east-1"
}

module "public_keys" {
    source = "./public_keys"
}

module "dns" {
    source                               = "./dns"
    kubernaut_load_balancer_dns_name     = "aacc2f118e0d411e7babf0e373ad4f70-1635760947.us-east-1.elb.amazonaws.com"
}

module "iam" {
    source = "./iam"
}

module "s3" {
    source = "./s3"
}
