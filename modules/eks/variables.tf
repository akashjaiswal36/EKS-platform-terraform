variable "cluster_name" {

}

variable "cluster_version" {

}

variable "vpc_id" {

}

variable "subnet_ids" {

}

variable "manage_aws_auth_configmap" {
  type    = bool
  default = false
}

variable "aws_auth_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}
