output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "elb_dns_name" {
  value = module.elb.elb_dns_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}
