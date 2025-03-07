# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  nullable    = false
  type        = string
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
  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-nessus testing"
  }
  description = "Tags to apply to all AWS resources created"
  nullable    = false
  type        = map(string)
}
