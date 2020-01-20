resource "aws_iam_user" "learning-terraform-user" {
  name = "learning-terraform-user"
}

module "ec2" {
  source = "./ec2"
  ec2Name = "My first module"
}
