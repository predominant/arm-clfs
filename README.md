# About

This repo, notes and instructions are designed to build linux from scratch in a cross compiled manner, in support of creating a stage1 tarball for Habitat Studio, for use with arm processors.

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
