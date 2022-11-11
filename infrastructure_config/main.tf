terraform {
  backend "local" {
    path = "backend/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "lambda" {
  source                = "terraform-aws-modules/lambda/aws"
  version               = "4.6.1"
  function_name         = "${var.environment_name}-${var.bucket_name}-triggered-lambda"
  description           = "Lambda created by terraform as test for improvements proposals for the devops team by carlos, first simple test"
  environment_variables = {"ENV": var.environment_name}
  handler               = "app.lambda_handler"
  runtime               = "python3.9"
  timeout               = 30
  source_path           = "../src/app.py"
}

module "bucket" {
  source = "./modules/s3-bucket-custom/"
  bucket_name = "${var.bucket_name}"
  lambda_arn  = module.lambda.lambda_function_arn
  lambda_name = module.lambda.lambda_function_name
}