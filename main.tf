// file: main.tf

provider "aws" {
    region = "us-east-1"
}

module "public_keys" {
    source = "./public_keys"
}

module "dns" {
    source                           = "./dns"
    kubernaut_load_balancer_dns_name = "a61240b327df711e7a23d0296a786aa0-1147244134.us-east-1.elb.amazonaws.com"
}
