#!/bin/bash

set -e -x

build_dll() {
	./autogen.sh
	echo "LDFLAGS = -no-undefined" >> Makefile.am
	./configure --host=$1 --enable-module-recovery --enable-experimental --enable-endomorphism --disable-jni
	make
}

# make clean
build_dll x86_64-linux-gnu

cp .libs/libsecp256k1.so ../libsecp256k1.dylib

# ./autogen.sh
# echo "LDFLAGS = -no-undefined" >> Makefile.am
# ./configure --host=x86_64-w64-mingw32 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni
# ./configure --host=i686-w64-mingw32 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni
