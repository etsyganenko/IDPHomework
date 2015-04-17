//
//  TSYBitOutput.h
//  TSYHomework
//
//  Created by Admin on 26.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYBitOutput__
#define __TSYHomework__TSYBitOutput__

#include <stdio.h>

typedef enum {
    TSYBigEndian,
    TSYLittleEndian
} TSYEndianness;

extern
void TSYBitValueOutput(uint8_t value);

extern
void TSYByteValueOutput(void *value, size_t size, TSYEndianness endianType);

extern
TSYEndianness TSYGetEndianness(void *value);

#endif /* defined(__TSYHomework__TSYBitOutput__) */
