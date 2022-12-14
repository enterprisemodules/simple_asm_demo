[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)

# Demo Puppet implementation

This repo contains a demonstration of a simple ASM + database installation. It uses the [`ora_profile`](https://forge.puppet.com/enterprisemodules/ora_profile) module to get a quick and easy start.

The name of the node indicates which version of Oracle will be installed in it i.e. asm112 has version 11.2. This demo is ready for Puppet 4,5,6 and 7.

## Starting the nodes masterless

All nodes are available to test with Puppet masterless. To do so, add `ml-` for the name when using vagrant:

```bash
vagrant up <ml-asm112|ml-asm121|ml-asm122|ml-asm180|ml-asm190|ml-asm210>
```

## Staring the nodes with PE

You can also test with a Puppet Enterprise server. To do so, add `pe-` for the name when using vagrant in the following order:

```bash
vagrant up pe-asmmaster
vagrant up <pe-asm112|pe-asm121|pe-asm122|pe-asm180|pe-asm190|pe-asm210>
```

## ordering

You must always use the specified order:

1. asmmaster
2. <asm112|asm121|asm122|asm180|asm190|asm210>

## Required software

The software must be placed in `modules/software/files`. It must contain the next files:

### OPatch update file
We have chosen to rename the download of the OPatch updates to contain the version of OPatch in the name.
This makes it more clear which version is included in the zipfile.
Make sure to also rename the zipfile when using this demo.

### Puppet Enterprise (Not needed when using masterless deployments)

- [puppet-enterprise-2021.5.0-el-8-x86_64.tar.gz (Extracted tar)](https://puppet.com/download-puppet-enterprise)

### Oracle Database version 21.0.0.0

- `LINUX.X64_213000_grid_home.zip`                (21c grid home)
- `LINUX.X64_213000_db_home.zip`                  (21c oracle home)
- `p6880880_190000_Linux-x86-64-12.2.0.1.33.zip`  (OPatch version 12.2.0.1.33)
- `p34526142_210000_Linux-x86-64.zip`             (21c OCT2022RU)

### Oracle Database version 19.0.0.0

- `LINUX.X64_193000_grid_home.zip`                (19c grid home)
- `LINUX.X64_193000_db_home.zip`                  (19c oracle home)
- `p6880880_190000_Linux-x86-64-12.2.0.1.33.zip`  (OPatch version 12.2.0.1.33)
- `p34416665_190000_Linux-x86-64.zip`             (19c OCT2022RU)
- `p34411846_190000_Linux-x86-64.zip`             (19c OCT2022RU OJVM)

### Oracle Database version 18.0.0.0

- `LINUX.X64_180000_grid_home.zip`                (18c grid home)
- `LINUX.X64_180000_db_home.zip`                  (18c oracle home)
- `p6880880_190000_Linux-x86-64-12.2.0.1.33.zip`  (OPatch version 12.2.0.1.33)
- `p32524152_180000_Linux-x86-64.zip`             (18c APR2021RU)
- `p32552752_180000_Linux-x86-64.zip`             (18c APR2021RU OJVM)

### Oracle Database version 12.2.0.1

- `linuxx64_12201_grid_home.zip`                  (12cR2 grid home)
- `linuxx64_12201_database.zip`                   (12cR2 oracle home)
- `p6880880_190000_Linux-x86-64-12.2.0.1.33.zip`  (OPatch version 12.2.0.1.33)
- `p33583921_122010_Linux-x86-64.zip`             (12cR2 JAN2022RU)

### Oracle Database version 12.1.0.2

- `oracleasmlib-2.0.12-1.el7.x86_64.rpm` (ASMLib rpm)
- `linuxamd64_12102_grid_1of2.zip`       (12c grid home file 1)
- `linuxamd64_12102_grid_1of2.zip`       (12c grid home file 2)
- `linuxamd64_12102_database_1of2.zip`   (12c oracle home file 1)
- `linuxamd64_12102_database_2of2.zip`   (12c oracle home file 2)

### Oracle Database version 11.2.0.4

- `p13390677_112040_Linux-x86-64_1of7.zip` (11g oracle home file 1)
- `p13390677_112040_Linux-x86-64_2of7.zip` (11g oracle home file 2)
- `p13390677_112040_Linux-x86-64_3of7.zip` (11g grid home)

You can download these file from
[here](http://support.oracle.com)
or
[here](https://www.oracle.com/database/technologies/oracle-database-software-downloads.html)

## Common issues

- Sometimes Linux virtual machine hangs while ssh connection during executions of vagrant script. The way to fix it is log in to the machine, as root, and run dhclient.
