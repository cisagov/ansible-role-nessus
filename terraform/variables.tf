# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "production_bucket_name" {
  description = "The name of the S3 bucket where the production Nessus package lives."
  default     = "cisa-cool-third-party-production"
}

variable "staging_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where the staging Nessus package lives."
  default     = "cisa-cool-third-party-staging"
}

variable "nessus_package_pattern" {
  description = "The pattern that matches the name of Nessus package objects in the S3 bucket specified by the bucket_name variable."
  default     = "Nessus-*.*"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-nessus testing"
  }
}
