// file: main.tf

provider "aws" {
    region = "us-east-1"
}

module "public_keys" {
    source = "./public_keys"
}

module "dns" {
    source                               = "./dns"
    kubernaut_load_balancer_dns_name     = "a61240b327df711e7a23d0296a786aa0-1147244134.us-east-1.elb.amazonaws.com"
//    kubernaut_dev_load_balancer_dns_name = "ab01adb287df811e79bf812fae669ccd-1922616925.us-east-1.elb.amazonaws.com"
}

module "iam" {
    source = "./iam"
}

module "s3" {
    source = "./s3"
}