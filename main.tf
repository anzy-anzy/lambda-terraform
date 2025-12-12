###############################################
# IAM Role for Lambda Execution
###############################################
resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.lambda_name}-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

###############################################
# IAM Policy Attachment: Basic Lambda Logging
###############################################
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

###############################################
# AWS Lambda Function
###############################################
resource "aws_lambda_function" "python_lambda" {
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  # Zip file is inside the lambda folder
  filename         = "${path.module}/lambda/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/lambda.zip")

  timeout = 5
}
