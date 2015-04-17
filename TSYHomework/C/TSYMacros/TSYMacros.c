//
//  TSYMacros.c
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYMacros.h"

#define TSYOutputValueGenerate(type, specifier) \
    void TSYOutput_##type(type value) { \
        printf("%"#specifier"\n", value); \
    }

#define TSYOutputValue(type, value) \
    TSYOutput_##type(value);

TSYOutputValueGenerate(int, d);
TSYOutputValueGenerate(char, c);

void TSYMacrosTest() {
    TSYOutputValue(int, 6);
    TSYOutputValue(char, 'F');
}
