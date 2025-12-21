variable "region" {
    description = "AWS region"
}

variable "cluster_name" {
    description = "EKS cluster name"
}

variable "cluster_version" {
    description = "EKS cluster version"
}

variable "cidr" {}
variable "azs" {}
variable "public_subnets" {}
variable "private_subnets" {}