# Create the test user.  We do not require SSM Parameter Store access
# for this role, so we can simply use cisagov/ci-iam-user-tf-module
# instead of cisagov/molecule-iam-user-tf-module.
module "user" {
  source = "github.com/cisagov/ci-iam-user-tf-module"

  providers = {
    aws    = aws.users
    aws.ci = aws.images_provisionaccount
  }

  role_description = "A role that can be assumed to allow for CI testing of ansible-role-nessus via Molecule."
  role_name        = "Test-ansible-role-nessus"
  user_name        = "test-ansible-role-nessus"
}

# Attach third-party S3 bucket read-only policy to the role used by the test
# user
resource "aws_iam_role_policy_attachment" "thirdpartybucketread" {
  provider = aws.images_provisionaccount

  policy_arn = module.bucket_access.policy.arn
  role       = module.user.role.name
}
