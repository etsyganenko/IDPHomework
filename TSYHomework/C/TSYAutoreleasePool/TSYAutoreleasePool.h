//
//  TSYAutoreleasePool.h
//  TSYHomework
//
//  Created by Admin on 31.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#ifndef __TSYHomework__TSYAutoreleasePool__
#define __TSYHomework__TSYAutoreleasePool__

#include <stdio.h>
#include <stdbool.h>
#include "TSYObject.h"
#include "TSYAutoreleasingStack.h"
#include "TSYLinkedList.h"

struct TSYAutoreleasePool {
    TSYLinkedList *_list;
    TSYAutoreleasingStack *_currentStack;
    
    uint64_t _stackCount;
    uint64_t _emptyStackCount;
};
typedef struct TSYAutoreleasePool TSYAutoreleasePool;

TSYAutoreleasePool *TSYAutoreleasePoolNew();

void __TSYAutoreleasePoolDeallocate();

void TSYAutoreleasePoolAddObject(TSYAutoreleasePool *pool, void *object);

void TSYAutoreleasePoolDrain(TSYAutoreleasePool *pool);

#endif /* defined(__TSYHomework__TSYAutoreleasePool__) */
