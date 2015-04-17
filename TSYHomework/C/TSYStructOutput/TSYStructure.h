//
//  TSYStructure.h
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYStructure__
#define __TSYHomework__TSYStructure__

#include <stdio.h>
#include <stdbool.h>

struct TSYStruct {
    bool boolValue1;
    short shortValue3;
    bool boolValue2;
    double doubleValue;
    bool boolValue3;
    bool boolValue4;
    float floatValue;
    int intValue;
    char *string;
    bool boolValue5;
    short shortValue2;
    bool boolValue6;
    long long longLongValue;
    short shortValue1;
};
typedef struct TSYStruct TSYStruct;

struct TSYOptimizedStruct {
    long long longLongValue;
    char *string;
    double doubleValue;
    float floatValue;
    int intValue;
    short shortValue3;
    short shortValue2;
    short shortValue1;
    bool boolValue1;
    bool boolValue2;
    bool boolValue3;
    bool boolValue4;
    bool boolValue5;
    bool boolValue6;
};
typedef struct TSYOptimizedStruct TSYOptimizedStruct;

struct TSYOptimizedStruct2 {
    long long longLongValue;
    double doubleValue;
    float floatValue;
    int intValue;
    short shortValue3;
    short shortValue2;
    short shortValue1;
    union {
        struct {
            bool boolValue1 : 1;
            bool boolValue2 : 1;
            bool boolValue3 : 1;
            bool boolValue4 : 1;
            bool boolValue5 : 1;
            bool boolValue6 : 1;
        } bits;
        char charValue;
    } unionStruct;
    char charValue1;
};
typedef struct TSYOptimizedStruct2 TSYOptimizedStruct2;

#endif /* defined(__TSYHomework__TSYStructure__) */
