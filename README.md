# jupyter-deployment

To rebuild the instance image, re-run the ansible playbook against a fresh instance.

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