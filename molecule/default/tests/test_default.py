"""Module containing the tests for the default scenario."""

import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


@pytest.mark.parametrize("pkg", ["nessus"])
def test_packages(host, pkg):
    """Test that the appropriate packages were installed."""
    assert host.package(pkg).is_installed


@pytest.mark.parametrize("f", ["/tmp/Nessus-8.2.3-debian6_amd64.deb"])
def test_tmp_files(host, f):
    """Test that the temporary files were deleted."""
    assert not host.file(f).exists
