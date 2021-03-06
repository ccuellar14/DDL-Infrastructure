# Config S3 State Terraform

terraform {
  backend "s3" {
    bucket  = "tfstate-dentsu"
    key     = "services/lakeformation.tfstate"
    region  = "us-west-2"
    profile = "dentsu"
  }
}
