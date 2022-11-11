variable "bucket_name" {
  description = "name to use for the bucket that triggers the lambda"
  type        = string
}

variable "environment_name" {
  description = "name of the environment to deploy to"
  type        = string
}