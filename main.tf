// file: main.tf

provider "aws" {
    region = "us-east-1"
}

module "public_keys" {
    source = "./public_keys"
}
