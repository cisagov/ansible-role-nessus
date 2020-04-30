# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the bucket that the user should be allowed to read from."
  default     = "cisa-cool-third-party-production"
}

variable "nessus_package_pattern" {
  description = "The pattern that matches the name of Nessus package objects in the S3 bucket specified by the bucket_name variable."
  default     = "Nessus-*-debian6_amd64.deb"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "NCATS OIS - Development"
    Application = "ansible-role-nessus testing"
  }
}
