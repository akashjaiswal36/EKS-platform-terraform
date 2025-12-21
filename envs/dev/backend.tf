terraform {
    backend "s3" {
        bucket = "dev-eks-terraform-state-devops-mri-123"
        key = "dev/eks/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terraform-locks"
        encrypt =  true
    }
}