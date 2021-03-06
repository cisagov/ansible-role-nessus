# This is the "default" provider that is used assume the roles in the
# other providers.  It uses the credentials of the caller.  It is also
# used to assume the roles required to access remote state in the
# Terraform backend.
provider "aws" {
  region = var.aws_region
}

# The provider used to create roles that can read objects from the
# production COOL "third-party" bucket
provider "aws" {
  alias  = "images-production"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.images_production.outputs.provisionthirdpartybucketreadroles_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create roles that can read objects from the
# staging COOL "third-party" bucket
provider "aws" {
  alias  = "images-staging"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.images_staging.outputs.provisionthirdpartybucketreadroles_role.arn
    session_name = local.caller_user_name
  }
}

# The provider used to create the test user
provider "aws" {
  alias  = "users"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.users.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
}
