# Build Target

Targetting Raspberry Pi Zero should ensure support on all Raspberry Pi variants

# CPU Information

```
CFLAGS="-O2 -pipe -mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard"
CXXFLAGS="${CFLAGS}"
CHOST="armv6j-hardfloat-linux-gnueabi"
```
