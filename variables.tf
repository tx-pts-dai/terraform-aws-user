variable "policy_json" {
  description = "Optional policy to attach to the user"
  type        = string
  default     = ""
}

variable "secret_name" {
  description = "AWS Secrets Manager secret name. To store the AWS IAM user's access keys"
  type        = string
}

variable "username" {
  description = "AWS IAM Username to create"
  type        = string
}
