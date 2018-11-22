#ifndef _SHA3_H_
#define _SHA3_H_

#include <stdint.h>
#include <stdlib.h>

#define decsha3(bits) \
	int sha3_##bits(uint8_t*, size_t, uint8_t const*, size_t);

decsha3(256)
decsha3(512)

SECP256K1_API SECP256K1_INLINE void SHA3_256(uint8_t* out32, uint8_t const* data, size_t const size)
{
	sha3_256(out32, 32, data, size);
}

SECP256K1_API SECP256K1_INLINE void SHA3_512(uint8_t* out64, uint8_t const* data, size_t const size)
{
	sha3_512(out64, 64, data, size);
}

#endif
