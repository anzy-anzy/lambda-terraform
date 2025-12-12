variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "us-east-1"
}

variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "MyPythonLambda"
}
