module "vpc" {
  source = "../../modules/vpc"

  project     = var.project
  environment = var.environment
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "sg" {
  source = "../../modules/security-groups"

  project     = var.project
  environment = var.environment
  vpc_id = module.vpc.vpc_id 
}

module "ec2" {
  source = "../../modules/ec2"

  project     = var.project
  environment = var.environment
  subnet_id   = module.vpc.subnet_id
  sg_id       = module.sg.sg_id
  ami         = "ami-0f58b397bc5c1f2e8"
}
module "s3" {
  source = "../../modules/s3"

  project     = var.project
  environment = var.environment
}

