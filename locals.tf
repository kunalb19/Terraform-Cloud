locals {
  name = "${var.owner}-aws"
  tags = {
    Name        = local.name
    Owner       = var.owner
    Application = "EKS"
    Environment = "Test"
  }
}