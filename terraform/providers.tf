# This is the "default" provider that is used assume the roles in the
# other providers.  It uses the credentials of the caller.  It is also
# used to assume the roles required to access remote state in the
# Terraform backend.
provider "aws" {
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create the role that can be assumed to do
# everything the CI user needs to do in the production account.
provider "aws" {
  alias = "images_production_provisionaccount"
  assume_role {
    role_arn     = data.terraform_remote_state.images_production.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create the role that can be assumed to do
# everything the CI user needs to do in the staging account.
provider "aws" {
  alias = "images_staging_provisionaccount"
  assume_role {
    role_arn     = data.terraform_remote_state.images_staging.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create roles that can read objects from the
# production third-party S3 bucket
provider "aws" {
  alias = "images_production_thirdparty"
  assume_role {
    role_arn     = data.terraform_remote_state.images_production.outputs.provisionthirdpartybucketreadroles_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create roles that can read objects from the
# staging third-party S3 bucket
provider "aws" {
  alias = "images_staging_thirdparty"
  assume_role {
    role_arn     = data.terraform_remote_state.images_staging.outputs.provisionthirdpartybucketreadroles_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create the test user
provider "aws" {
  alias = "users"
  assume_role {
    role_arn     = data.terraform_remote_state.users.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}
