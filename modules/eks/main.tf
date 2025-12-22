module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version


  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  access_entries = {
  akash_admin = {
    principal_arn = "arn:aws:iam::178502900821:user/akash"

    policy_associations = {
      admin = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = {
          type = "cluster"
        }
      }
    }
  }
  }


  enable_irsa = true

  # EKS Managed Node Group(s)

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 2
      desired_size = 2

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"

      iam_role_additional_policies = {
        ecr = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      }
    }
  }

  tags = {
    Environment = "dev"
  }
}
