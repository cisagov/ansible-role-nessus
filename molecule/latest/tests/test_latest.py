"""Module containing the tests for the latest scenario."""

# TODO: See cisagov/ansible-role-nessus#22 for some thoughts on
# sharing the same test code among the different Molecule scenarios.

# Standard Python Libraries
import os

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")

# The architecture as listed in the Nessus package filename
arch = "amd64"
# The Linux distribution as listed in the Nessus package filename
distro = "debian9"
# The format/file extension of the Nessus package
fmt = "deb"
# The version of Nessus that should be installed
version = "10.3.0"


@pytest.mark.parametrize("pkg", ["expect", "jq", "nessus"])
def test_packages(host, pkg):
    """Test that the appropriate packages were installed."""
    assert host.package(pkg).is_installed


def test_nessus_version(host):
    """Check that the correct version of Nessus was installed."""
    cmd = host.run("/opt/nessus/sbin/nessusd --version")
    assert f" {version} " in cmd.stdout


@pytest.mark.parametrize("f", [f"/tmp/Nessus-{version}-{distro}_{arch}.{fmt}"])
def test_tmp_files(host, f):
    """Test that the temporary files were deleted."""
    assert not host.file(f).exists
