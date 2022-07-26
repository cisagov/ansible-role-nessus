"""Module containing the tests for the latest scenario."""

# Standard Python Libraries
import os

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


@pytest.mark.parametrize("pkg", ["expect", "jq", "nessus"])
def test_packages(host, pkg):
    """Test that the appropriate packages were installed."""
    assert host.package(pkg).is_installed


def test_nessus_version(host):
    """Check that the correct version of Nessus was installed."""
    cmd = host.run("/opt/nessus/sbin/nessusd --version")
    assert " 10.3.0 " in cmd.stdout


@pytest.mark.parametrize("f", ["/tmp/Nessus-10.3.0-debian9_amd64.deb"])
def test_tmp_files(host, f):
    """Test that the temporary files were deleted."""
    assert not host.file(f).exists
