#!/bin/bash

. _common.sh

build_line "Clearing CFLAGS"

unset CFLAGS
echo unset CFLAGS >> ~/.bashrc
