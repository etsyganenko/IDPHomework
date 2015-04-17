//
//  TSYBitOutput.c
//  TSYHomework
//
//  Created by Admin on 26.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYBitOutput.h"

TSYEndianness TSYGetEndianness(void *value) {
//    uint32_t mask = 1;
//    uint32_t *intValue = (uint32_t *)value;
//    
//    return (*intValue & mask);
    
    return (*((uint32_t *)value) & 1) ? TSYBigEndian : TSYLittleEndian;
}

void TSYBitValueOutput(uint8_t value) {
    for (uint8_t bitIter = 0; bitIter < 8; bitIter++) {
        printf("%u", 0 != (128 & value));
        value <<= 1;
    }
}

void TSYByteValueOutput(void *value, size_t size, TSYEndianness endianType) {
    uint8_t *charValue = (uint8_t *)value;
    uint8_t byteValue = 0;
    
    for (uint8_t iter = 0; iter < size; iter++) {
//        if (TSYLittleEndian == endianType) {
//            byteValue = size - 1 - iter;
//        } else {
//            byteValue = iter;
//        }
        byteValue = (TSYLittleEndian == endianType) ? (size - 1 - iter) : iter;
        
        TSYBitValueOutput(charValue[byteValue]);
        
        printf(" ");
    }
    
    printf("\n");
}
