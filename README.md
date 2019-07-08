# jupyter-deployment

To rebuild the instance image, re-run the ansible playbook against a fresh instance (tested with Ubuntu 18.04 LTS (gcp: `ubuntu-1804-lts`)). Recommended resources: >= 1 vcpu, >= 4GB mem, >= 20GB disk.

First place the IP address of the instance into `inventory.ini`, and set the user of the ssh key used to authenticate to the instance.

Next pick something you want to use as the jupyter notebook token.  This should be something secure, difficult to guess, because jupyter available on the network enable trivial remote arbitrary code execution.  One way to generate a random token is:
```
$ head -c 24 /dev/urandom | base64
```

Then run the playbook:

```
$ ansible-playbook -i inventory.ini playbook.yaml
```

This playbook does a series of high level steps:
- installs jupyter and R
- installs the R jupyter kernel
- installs nginx, and port 443 host block, and creates a self-signed cert
- installs systemd service files for autostarting the jupyter server

Notes:
- The instance should have at least 1GiB of free space.
- Jupyter notebooks vary in resource demands. Those doing multi-threaded compute should choose an appropriate instance with more CPUs. Many notebooks are more query based and single-threaded, so more memory makes more sense for the instance type.