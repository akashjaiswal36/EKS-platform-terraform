provider "aws" {
    region = var.region
}

module "vpc" {
    source          = "../../modules/vpc"

    cidr            = var.cidr
    azs             = var.azs
    private_subnets = var.public_subnets
    public_subnets  = var.private_subnets

}

module "eks" {
    source = "../../modules/eks"

    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version
    vpc_id          = module.vpc.vpc_id
    subnet_ids      = module.vpc.private_subnets

    manage_aws_auth_configmap = true

    aws_auth_users = [
        {
        userarn  = "arn:aws:iam::178502900821:user/akash"
        username = "akash"
        groups   = ["system:masters"]
        }
    ]
}