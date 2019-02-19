# About

This repo, notes and instructions are designed to build linux from scratch in a cross compiled manner, in support of creating a stage1 tarball for Habitat Studio, for use with arm processors.

# Usage

## Sudo Access

The scripts contained within expect to be run as a non-root user. They also expect that user to have unpassworded sudo access to escalate privileges. If sudo requires a password, it will still work, but you will be typing a lot.

## Complete run

A complete run can be initiated by executing the `run-all.sh` script when the VM starts.

## Starting and using the VM

A Vagrantfile is included which is bare/minimal.

It doesn't initiate the build (yet) because the process is so lengthy, and it helps with debugging to run it manually.

Run example:

```
vagrant up
vagrant ssh
/opt/arm-clfs/run-all.sh
```

# Build Target

Targetting Raspberry Pi Zero should ensure support on all Raspberry Pi variants

# CPU Information

```
CFLAGS="-O2 -pipe -mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard"
CXXFLAGS="${CFLAGS}"
CHOST="armv6j-hardfloat-linux-gnueabi"
```

# References

* [Cross-Compiled Linux From Scrarch - Embedded](http://clfs.org/view/clfs-embedded/arm/)
