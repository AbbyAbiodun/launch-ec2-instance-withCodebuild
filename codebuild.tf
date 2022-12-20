resource "aws_codebuild_project" "plan" {
  name          = "codebuild-plan"
  description   = "Plan stage for terraform"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:0.14.3"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
  

 }
 source {
    type            = "GITHUB"
    location        = "https://github.com/AbbyAbiodun/launch-ec2-instance-withCodebuild"
    
    git_clone_depth = 1

  }

  source_version = "master"

}

resource "aws_codebuild_project" "apply" {
  name          = "codebuild-apply"
  description   = "Apply stage for terraform"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:0.14.3"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
    
 }
 source {
    type            = "GITHUB"
    location        = "https://github.com/AbbyAbiodun/launch-ec2-instance-withCodebuild"
    git_clone_depth = 1

   
  }

  source_version = "master"

}