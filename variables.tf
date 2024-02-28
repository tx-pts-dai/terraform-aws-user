variable "policy_json" {
  description = "Policy to attach to the user"
  type        = string
}

variable "policy_name" {
  description = "Name to give to the policy attached to the user"
  type        = string
}

variable "secret_name" {
  description = "AWS Secrets Manager secret name. To store the AWS IAM user's access keys"
  type        = string
}

variable "username" {
  description = "AWS IAM Username to create"
  type        = string
}
