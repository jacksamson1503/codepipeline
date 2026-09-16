# GitHub → Jenkins → Docker → ECR → ECS CI/CD

This project demonstrates a simple AWS CI/CD deployment:

GitHub → Jenkins → Docker → Amazon ECR → Amazon ECS (EC2 launch type)

## Application

A small Flask application listening on port 5000.

## Jenkins prerequisites

The Jenkins agent that runs this pipeline needs:

- Git
- Docker
- AWS CLI
- Permission to run Docker
- AWS credentials/EC2 IAM role with permission to push to ECR and update the ECS service

## Jenkins environment variables

Set these in Jenkins or the Jenkins agent environment:

- `AWS_ACCOUNT_ID` — your 12-digit AWS account ID

The following values are defined in the Jenkinsfile and should match your AWS resources:

- `AWS_REGION`
- `ECR_REPOSITORY`
- `ECS_CLUSTER`
- `ECS_SERVICE`

## AWS flow

1. Jenkins checks out the GitHub repository.
2. Jenkins validates the Python file.
3. Jenkins builds the Docker image.
4. Jenkins authenticates to Amazon ECR.
5. Jenkins pushes the image to ECR.
6. Jenkins forces a new ECS deployment.
7. ECS starts the new task using the EC2 capacity provider/EC2 container instance.

## Important

The ECS task definition must reference the ECR image repository. The ECS service must already exist before the Jenkins deployment stage runs.
