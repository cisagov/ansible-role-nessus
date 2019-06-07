variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "NCATS OIS - Development"
    Application = "ansible-role-nessus testing"
  }
}

variable "bucket_name" {
  description = "The name of the bucket that the user should be allowed to read from."
  default     = "ncats-3rd-party-packages"
}
