//
//  TSYAutoreleasingStack.h
//  TSYHomework
//
//  Created by Admin on 26.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYAutoreleasingStack__
#define __TSYHomework__TSYAutoreleasingStack__

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "TSYObject.h"
#include "TSYPropertySet.h"

typedef enum {
    TSYAutoreleasingStackNullPop,
    TSYAutoreleasingStackObjectPop
} TSYAutoreleasingStackPopResult;

typedef struct TSYAutoreleasingStack TSYAutoreleasingStack;
struct TSYAutoreleasingStack {
    TSYObject _super;
    
    void **_objects;
    uint64_t _size;
    uint64_t _currentSize;
};

extern
TSYAutoreleasingStack *TSYAutoreleasingStackCreateWithSize(uint64_t size);

extern
void __TSYAutoreleasingStackDeallocate(TSYAutoreleasingStack *stack);

extern
uint64_t TSYAutoreleasingStackGetSize(TSYAutoreleasingStack *stack);

extern
uint64_t TSYAutoreleasingStackGetCurrentSize(TSYAutoreleasingStack *stack);

extern
void **TSYAutoreleasingStackGetObjects(TSYAutoreleasingStack *stack);

extern
void TSYAutoreleasingStackPushObject(TSYAutoreleasingStack *stack, void *object);

extern
TSYAutoreleasingStackPopResult TSYAutoreleasingStackPopObject(TSYAutoreleasingStack *stack);

extern
TSYAutoreleasingStackPopResult TSYAutoreleasingStackPopObjects(TSYAutoreleasingStack *stack);

extern
void TSYAutoreleasingStackPopAllObjects(TSYAutoreleasingStack *stack);

extern
bool TSYAutoreleasingStackIsFull(TSYAutoreleasingStack *stack);

extern
bool TSYAutoreleasingStackIsEmpty(TSYAutoreleasingStack *stack);

#endif /* defined(__TSYHomework__TSYAutoreleasingStack__) */
