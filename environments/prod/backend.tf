terraform {
  backend "s3" {
    bucket         = "multilogistics-tf-state-2026"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "multilogistics-locks"
  }
}