#!/bin/bash

set -e -x

build_dll() {
	./autogen.sh
	echo "LDFLAGS = -no-undefined" >> Makefile.am
	./configure --host=$1 --enable-module-recovery --enable-experimental --enable-endomorphism --disable-jni --disable-benchmark --disable-tests
	make
}

# make clean
build_dll i686-apple-darwin17.6.0

cp .libs/libsecp256k1.0.dylib ../libsecp256k1.dylib

# ./autogen.sh
# echo "LDFLAGS = -no-undefined" >> Makefile.am
# ./configure --host=x86_64-w64-mingw32 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni
# ./configure --host=i686-w64-mingw32 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni
