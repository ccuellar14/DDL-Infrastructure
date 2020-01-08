# Providers

provider "aws" {
    region  = "${var.region}"
    version = "~> 2.8"
    shared_credentials_file = "~/.aws/credentials"
    profile = "dentsu"
}

provider "null" {
    version = "~> 2.1"
}

provider "random" {
    version = "~> 2.0"
}

provider "template" {
    version = "~> 2.1"
}
