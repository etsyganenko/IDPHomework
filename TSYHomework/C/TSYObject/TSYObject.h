//
//  TSYObject.h
//  TSYHomework
//
//  Created by Admin on 27.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYObject__
#define __TSYHomework__TSYObject__

#include <stdio.h>
#include <stdlib.h>

typedef void(*TSYDeallocateCallback)(void *);

struct TSYObject {
    uint64_t _referenceCount;
    TSYDeallocateCallback _deallocateCallback;
};
typedef struct TSYObject TSYObject;

extern
void *__TSYObjectCreate(size_t objectSize, TSYDeallocateCallback deallocateCallback);

#define TSYObjectCreate(type) \
    __TSYObjectCreate(sizeof(type), (TSYDeallocateCallback)__##type##Deallocate)

extern
uint64_t TSYObjectGetReferenceCount(void *object);

extern
void TSYObjectRetain(void *object);

extern
void TSYObjectRelease(void *object);

extern
void __TSYObjectDeallocate(void *object);

#endif /* defined(__TSYHomework__TSYObject__) */
