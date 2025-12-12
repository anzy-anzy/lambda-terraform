# AWS Lambda Deployment Using Terraform  Assignment Guide
### Project Description

This project demonstrates how to deploy a Python AWS Lambda function using Terraform.
The Lambda function accepts an event input containing a `name1` field and returns a success message that includes that name.

### This README provides step-by-step instructions for:

Project setup

Preparing the Lambda function

Creating the deployment package

Deploying the function using Terraform

Testing the Lambda successfully

This submission fulfills the assignment requirements.

### Project Structure

My repository should look like this
```bash
lambda-terraform
├── lambda/
│   ├── lambda_function.py
│   └── lambda.zip
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```
## Steps to follow

#### Step 1 — Create the Deployment Package (ZIP File)

Navigate into the lambda folder which contain the python file
```bash
Compress-Archive -Path lambda_function.py -DestinationPath lambda.zip
```
After this, inside the lambda/ folder you must have:
```bash
lambda_function.py
lambda.zip
```
---
<img width="1920" height="950" alt="Screenshot (1270)" src="https://github.com/user-attachments/assets/e04e9641-d939-4055-a55b-1e08d2caabe7" />

This ZIP file will be uploaded to AWS Lambda by Terraform.

## ⚙️ Deployment Step (terraform files)
1) Initialize Terraform
```bash
terraform init
```
<img width="1920" height="960" alt="Screenshot (1271)" src="https://github.com/user-attachments/assets/c8bedcfd-1fe5-4b51-bd39-3cc19953102d" />

2) Validate Terraform
```bash
terraform validate
```
<img width="1920" height="962" alt="Screenshot (1272)" src="https://github.com/user-attachments/assets/7f110ab3-e353-4810-89af-6482530e5a45" />

3) Plan terraform
```terraform plan
```
<img width="1920" height="970" alt="Screenshot (1273)" src="https://github.com/user-attachments/assets/a6d4ed43-9237-4b9a-9f62-4af27852260f" />

4) Apply Terraform
```bash
terraform apply
```
<img width="1920" height="966" alt="Screenshot (1276)" src="https://github.com/user-attachments/assets/d58c0db0-c900-478b-a401-4a384040cb5f" />
## Test the Lambda Function in AWS Console
- Go to the console to see the lambda function created
<img width="1920" height="828" alt="Screenshot (1277)" src="https://github.com/user-attachments/assets/0493afc2-e81c-4eda-90b0-6614b91208c8" />
- Click on test
- Create a new test event

- Name the test:
`TestNameEvent`

Use this JSON input:
```bash
{
  "name1": "Anslem"
}
```

click test again
<img width="1920" height="885" alt="Screenshot (1278)" src="https://github.com/user-attachments/assets/7e1b06b0-63b7-4838-82ee-8e34537a7af9" />
### Finally i destroy everthing
```bash
terraform destroy
```
<img width="1920" height="978" alt="Screenshot (1279)" src="https://github.com/user-attachments/assets/65b7623e-96dc-4afb-b56a-d2d714f577ae" />


Conclusion

This project demonstrated how to deploy a Python-based AWS Lambda function using Terraform while following best practices for packaging, infrastructure provisioning, and testing. By creating a dedicated IAM execution role, packaging the Lambda code as a ZIP artifact, and deploying it through Terraform, we implemented a reproducible and automated serverless workflow.

The hands-on exercise reinforced essential Cloud and DevOps skills, including infrastructure as code, event-driven development, environment configuration, and resource cleanup. After deployment, the function was successfully tested with a sample event, confirming correct execution and response formatting.

This project provides a solid foundation for building more advanced serverless applications, integrating CI/CD, or expanding Terraform automation across additional AWS services. The stack can now be safely removed using terraform destroy, completing the full lifecycle of infrastructure management.
