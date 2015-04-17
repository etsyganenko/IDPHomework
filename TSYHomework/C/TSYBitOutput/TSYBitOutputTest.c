//
//  TSYBitOutputTest.c
//  TSYHomework
//
//  Created by Admin on 26.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYBitOutputTest.h"

void TSYBitOutputTest() {
    char charValue = 'X';
    int intValue1 = 1;
    int intValue2 = 2;
    int intValue3 = 4;
    
    TSYByteValueOutput(&charValue, 1, TSYBigEndian);
    TSYByteValueOutput(&charValue, 1, TSYLittleEndian);
    
    TSYByteValueOutput(&intValue1, 4, TSYBigEndian);
    TSYByteValueOutput(&intValue1, 4, TSYLittleEndian);
    
    TSYByteValueOutput(&intValue2, 4, TSYBigEndian);
    TSYByteValueOutput(&intValue2, 4, TSYLittleEndian);
    
    TSYByteValueOutput(&intValue3, 4, TSYBigEndian);
    TSYByteValueOutput(&intValue3, 4, TSYLittleEndian);
}
