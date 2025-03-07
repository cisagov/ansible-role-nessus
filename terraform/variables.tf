# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "nessus_bucket" {
  description = "The name of the S3 bucket where the production Nessus package lives."
  nullable    = false
  type        = string
}
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

variable "nessus_package_pattern" {
  default     = "Nessus-*.*"
  description = "The pattern that matches the name of Nessus package objects in the S3 bucket specified by the nessus_bucket variable."
  nullable    = false
  type        = string
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
