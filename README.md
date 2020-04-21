# ansible-role-nessus #

[![GitHub Build Status](https://github.com/cisagov/ansible-role-nessus/workflows/build/badge.svg)](https://github.com/cisagov/ansible-role-nessus/actions)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/cisagov/ansible-role-nessus.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/cisagov/ansible-role-nessus/alerts/)
[![Language grade: Python](https://img.shields.io/lgtm/grade/python/g/cisagov/ansible-role-nessus.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/cisagov/ansible-role-nessus/context:python)

An Ansible role for installing
[Nessus](https://www.tenable.com/products/nessus/nessus-professional).

## Requirements ##

None.

## Role Variables ##

None.

## Dependencies ##

None.

## Example Playbook ##

Here's how to use it in a playbook:

```yaml
- hosts: all
  become: yes
  become_method: sudo
  roles:
    - nessus
```

## Development Pre-requisites ##

In order for the `molecule` tests to succeed in GitHub Actions, this project
requires a test user to exist in AWS.  The accompanying terraform code
will create the user with the appropriate name and permissions.  This only
needs to be run once per project, per AWS account.

Before creating the test user, ensure that you are using an AWS profile with
appropriate permissions.

To create the test user, follow these instructions:

```console
cd terraform
terraform init -upgrade=true
terraform apply
```

Once the user is created you will need to update the
[repository's secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
with the new encrypted environment variables. This should be done using the
[`terraform-to-secrets`](https://github.com/cisagov/development-guide/tree/develop/project_setup#terraform-iam-credentials-to-github-secrets-)
tool available in the
[development guide](https://github.com/cisagov/development-guide). Instructions
for how to use this tool can be found in the
["Terraform IAM Credentials to GitHub Secrets" section](https://github.com/cisagov/development-guide/tree/develop/project_setup#terraform-iam-credentials-to-github-secrets-).
of the Project Setup README.

If you have appropriate permissions for the repository you can view existing
secrets on the
[appropriate page](https://github.com/cisagov/nessus-packer/settings/secrets)
in the repository's settings.

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

## Author Information ##

Shane Frasier - <jeremy.frasier@trio.dhs.gov>
