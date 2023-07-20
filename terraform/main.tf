provider "aws" {
  region = "us-east-1"  # Altere para sua região AWS preferida
}

resource "aws_elastic_beanstalk_application" "App" {
  name        = "App"
  description = "Elastic Beanstalk application"
}

resource "aws_elastic_beanstalk_environment" "staging" {
  name                = "App-staging"
  application         = aws_elastic_beanstalk_application.example_app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.4.2 running Node.js 16"
  wait_for_ready_timeout = "10m"  # Tempo máximo para aguardar o ambiente ficar pronto

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"  # Altere para "LoadBalanced" se quiser usar balanceador de carga
  }
}

resource "aws_elastic_beanstalk_environment" "production" {
  name                = "App-production"
  application         = aws_elastic_beanstalk_application.example_app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.4.2 running Node.js 16"
  wait_for_ready_timeout = "10m"

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "s3-bucket"  # Substitua pelo nome do bucket desejado
  acl    = "private"
}

resource "aws_iam_user" "github_actions" {
  name = "github-actions"
}

resource "aws_iam_access_key" "github_actions" {
  user = aws_iam_user.github_actions.name
}
