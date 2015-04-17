//
//  TSYArray.h
//  TSYHomework
//
//  Created by Admin on 02.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYArray__
#define __TSYHomework__TSYArray__

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include "TSYObject.h"
#include "TSYPropertySet.h"

extern
const uint64_t TSYObjectNotFound;

struct TSYArray {
    TSYObject _object;
    
    uint64_t _length;
    uint64_t _count;
    
    TSYObject **_objects;
};
typedef struct TSYArray TSYArray;

extern
TSYArray *TSYArrayCreate();

extern
uint64_t TSYArrayGetCount(TSYArray *array);

extern
uint64_t TSYArrayGetLength(TSYArray *array);

extern
void TSYArrayAddObject(TSYArray *array, void *object);

extern
void TSYArrayRemoveObject(TSYArray *array, void *object);

extern
void TSYArrayRemoveAllObjects(TSYArray *array);

extern
bool TSYArrayContainsObject(TSYArray *array, void *object);

extern
void *TSYArrayGetObjectAtIndex(TSYArray *array, uint64_t index);

extern
void TSYArraySetObjectAtIndex(TSYArray *array, void *object, uint64_t index);

extern
uint64_t TSYArrayGetIndexOfObject(TSYArray *array, void *object);

extern
void TSYArrayRemoveObjectAtIndex(TSYArray *array, uint64_t index);

extern
void __TSYArrayDeallocate(TSYArray *array);

#endif /* defined(__TSYHomework__TSYArray__) */
