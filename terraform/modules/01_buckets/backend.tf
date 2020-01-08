# Config S3 State Terraform

terraform {
  backend "s3" {
    bucket  = "tfstate-dentsu"
    key     = "services/storage.tfstate"
    region  = "us-west-2"
    profile = "dentsu"
  }
}
