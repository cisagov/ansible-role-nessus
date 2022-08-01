"""Module containing the tests for the latest scenario."""

# TODO: See cisagov/ansible-role-nessus#22 for some thoughts on
# sharing the same test code among the different Molecule scenarios.

# Standard Python Libraries
import os

# Third-Party Libraries
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")

# The version of Nessus that should be installed
version = "10.3.0"


def test_packages(host):
    """Test that the appropriate packages were installed."""
    debian_packages = ["expect", "jq", "nessus"]
    redhat_packages = ["expect", "jq", "Nessus"]
    if host.system_info.distribution in ["debian", "kali", "ubuntu"]:
        assert all([host.package(pkg).is_installed for pkg in debian_packages])
    elif host.system_info.distribution in ["amzn", "fedora"]:
        assert all([host.package(pkg).is_installed for pkg in redhat_packages])
    else:
        assert False, f"Unknown distribution {host.system_info.distribution}"


def test_nessus_version(host):
    """Check that the correct version of Nessus was installed."""
    cmd = host.run("/opt/nessus/sbin/nessusd --version")
    assert f" {version} " in cmd.stdout
