#!/bin/bash

set -e -x

build_dll() {
	./autogen.sh
	echo "LDFLAGS = -no-undefined" >> Makefile.am
	./configure --host=$1 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni
	make
}

git clone https://github.com/bitcoin-core/secp256k1.git

cd secp256k1

build_dll i686-w64-mingw32

cp .libs/libsecp256k1-0.dll ../libsecp256k1.dll

# ./autogen.sh
# echo "LDFLAGS = -no-undefined" >> Makefile.am
# ./configure --host=x86_64-w64-mingw32 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni
# ./configure --host=i686-w64-mingw32 --enable-module-recovery --enable-experimental --enable-module-ecdh --enable-endomorphism --disable-jni