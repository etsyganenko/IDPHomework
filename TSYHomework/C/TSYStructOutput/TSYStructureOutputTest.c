//
//  TSYStructureOutputTest.c
//  TSYHomework
//
//  Created by Admin on 25.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYStructureOutputTest.h"
#include "TSYStructure.h"

#define TSYStructValueOffset(type, value) \
    printf("offset of "#value": %lu\n", offsetof(type, value));

#define TSYStructOffsets(type) \
    printf(""#type" offsets:\n"); \
    TSYStructValueOffset(type, boolValue1); \
    TSYStructValueOffset(type, shortValue3); \
    TSYStructValueOffset(type, boolValue2); \
    TSYStructValueOffset(type, doubleValue); \
    TSYStructValueOffset(type, boolValue3); \
    TSYStructValueOffset(type, boolValue4); \
    TSYStructValueOffset(type, floatValue); \
    TSYStructValueOffset(type, intValue); \
    TSYStructValueOffset(type, string); \
    TSYStructValueOffset(type, boolValue5); \
    TSYStructValueOffset(type, shortValue2); \
    TSYStructValueOffset(type, boolValue6); \
    TSYStructValueOffset(type, longLongValue); \
    TSYStructValueOffset(type, shortValue1); \
    printf("\n");

//#define TSYOptimizedStructOffsets(type) \
//    printf(""#type" offsets:\n"); \
//    TSYStructValueOffset(type, longLongValue); \
//    TSYStructValueOffset(type, string); \
//    TSYStructValueOffset(type, doubleValue); \
//    TSYStructValueOffset(type, floatValue); \
//    TSYStructValueOffset(type, intValue); \
//    TSYStructValueOffset(type, shortValue1); \
//    TSYStructValueOffset(type, shortValue2); \
//    TSYStructValueOffset(type, shortValue3); \
//    TSYStructValueOffset(type, boolValue1); \
//    TSYStructValueOffset(type, boolValue2); \
//    TSYStructValueOffset(type, boolValue3); \
//    TSYStructValueOffset(type, boolValue4); \
//    TSYStructValueOffset(type, boolValue5); \
//    TSYStructValueOffset(type, boolValue6); \
//    printf("\n");

//void TSYStructOffsetOutput() {
//    printf("TSYStruct offsets:\n");
//    printf("offset of boolValue1: %lu\n", offsetof(TSYStruct, boolValue1));
//    printf("offset of shortValue3: %lu\n", offsetof(TSYStruct, shortValue3));
//    printf("offset of boolValue2: %lu\n", offsetof(TSYStruct, boolValue2));
//    printf("offset of doubleValue: %lu\n", offsetof(TSYStruct, doubleValue));
//    printf("offset of boolValue3: %lu\n", offsetof(TSYStruct, boolValue3));
//    printf("offset of boolValue4: %lu\n", offsetof(TSYStruct, boolValue4));
//    printf("offset of floatValue: %lu\n", offsetof(TSYStruct, floatValue));
//    printf("offset of intValue: %lu\n", offsetof(TSYStruct, intValue));
//    printf("offset of string: %lu\n", offsetof(TSYStruct, string));
//    printf("offset of boolValue5: %lu\n", offsetof(TSYStruct, boolValue5));
//    printf("offset of shortValue2: %lu\n", offsetof(TSYStruct, shortValue2));
//    printf("offset of boolValue6: %lu\n", offsetof(TSYStruct, boolValue6));
//    printf("offset of longLongValue: %lu\n", offsetof(TSYStruct, longLongValue));
//    printf("offset of shortValue1: %lu\n", offsetof(TSYStruct, shortValue1));
//    printf("\n");
//}

//void TSYOptimizedStructOffsetOutput() {
//    printf("TSYOptimizedStruct offsets:\n");
//    printf("offset of longLongValue: %lu\n", offsetof(TSYOptimizedStruct, longLongValue));
//    printf("offset of string: %lu\n", offsetof(TSYOptimizedStruct, string));
//    printf("offset of doubleValue: %lu\n", offsetof(TSYOptimizedStruct, doubleValue));
//    printf("offset of floatValue: %lu\n", offsetof(TSYOptimizedStruct, floatValue));
//    printf("offset of intValue: %lu\n", offsetof(TSYOptimizedStruct, intValue));
//    printf("offset of shortValue1: %lu\n", offsetof(TSYOptimizedStruct, shortValue1));
//    printf("offset of shortValue2: %lu\n", offsetof(TSYOptimizedStruct, shortValue2));
//    printf("offset of shortValue3: %lu\n", offsetof(TSYOptimizedStruct, shortValue3));
//    printf("offset of boolValue1: %lu\n", offsetof(TSYOptimizedStruct, boolValue1));
//    printf("offset of boolValue2: %lu\n", offsetof(TSYOptimizedStruct, boolValue2));
//    printf("offset of boolValue3: %lu\n", offsetof(TSYOptimizedStruct, boolValue3));
//    printf("offset of boolValue4: %lu\n", offsetof(TSYOptimizedStruct, boolValue4));
//    printf("offset of boolValue5: %lu\n", offsetof(TSYOptimizedStruct, boolValue5));
//    printf("offset of boolValue6: %lu\n", offsetof(TSYOptimizedStruct, boolValue6));
//    printf("\n");
//}

#define TSYStructureSize(type) \
    { \
        printf("Size of "#type": %lu\n", sizeof(type)); \
    }

void TSYStructureOutputTests() {
    TSYStructureSize(TSYStruct);
    TSYStructureSize(TSYOptimizedStruct);
    TSYStructureSize(TSYOptimizedStruct2);
    
    printf("\n");
    
//    TSYStructOffsetOutput();
//    TSYOptimizedStructOffsetOutput();
    
    TSYStructOffsets(TSYStruct);
    TSYStructOffsets(TSYOptimizedStruct);
//    TSYOptimizedStructOffsets(TSYOptimizedStruct);
}

#undef TSYStructureSize
#undef TSYStructValueOffset
#undef TSYStructOffsets
