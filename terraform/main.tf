provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}

module "elb" {
  source = "./modules/elb"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  ec2_instance_id = module.ec2.instance_id
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
}

module "lambda" {
  source = "./modules/lambda"
  bucket_name = module.s3.bucket_name
}
