//
//  TSYAutoreleasePool.c
//  TSYHomework
//
//  Created by Admin on 31.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYAutoreleasePool.h"

static
TSYAutoreleasePool *__TSYAutoreleasePool = NULL;

static
const uint64_t TSYAutoreleaseStackSize = 4096;

static
const uint64_t TSYAutoreleasePoolMaxEmptyStackCount = 2;

#pragma mark -
#pragma mark Private Declarations

void TSYAutoreleasePoolSetCurrentStack(TSYAutoreleasePool *pool, TSYAutoreleasingStack *stack);

TSYAutoreleasingStack *TSYAutoreleasePoolGetCurrentStack(TSYAutoreleasePool *pool);

void TSYAutoreleasePoolInsertObject(TSYAutoreleasePool *pool, void *object);

TSYAutoreleasePool *TSYAutoreleasePoolGetPool();

void TSYAutoreleasePoolSetList(TSYAutoreleasePool *pool, TSYLinkedList *list);

TSYLinkedList *TSYAutoreleasePoolGetList(TSYAutoreleasePool *pool);

uint64_t TSYAutoreleasePoolGetEmptyStackCount(TSYAutoreleasePool *pool);

void TSYAutoreleasePoolDeflateIfNeeded(TSYAutoreleasePool *pool);

void TSYAutoreleasePoolDeflate(TSYAutoreleasePool *pool);

#pragma mark -
#pragma mark Public Implementations

TSYAutoreleasePool *TSYAutoreleasePoolNew() {
    TSYAutoreleasePool *pool = TSYAutoreleasePoolGetPool();
    
    if (NULL == pool) {
        pool = calloc(1, sizeof(*pool));
        
        TSYLinkedList *list = TSYLinkedListCreate();
        TSYAutoreleasePoolSetList(pool, list);
        TSYObjectRelease(list);
    }
    
    TSYAutoreleasePoolInsertObject(pool, NULL);
    
    return pool;
}

void __TSYAutoreleasePoolDeallocate(TSYAutoreleasePool *pool) {
    if (NULL == pool) {
        return;
    }
//    TSYAutoreleasingStackPopAllObjects(TSYAutoreleasePoolGetCurrentStack(pool));
//    TSYLinkedListRemoveAllObjects(TSYAutoreleasePoolGetList(pool));
    
    TSYAutoreleasePoolSetCurrentStack(pool, NULL);
    TSYAutoreleasePoolSetList(pool, NULL);
    
    free(pool);
    pool = NULL;
}

void TSYAutoreleasePoolInsertObject(TSYAutoreleasePool *pool, void *object) {
    if (NULL == pool) {
        return;
    }
    
    TSYAutoreleasingStack *currentStack = TSYAutoreleasePoolGetCurrentStack(pool);
    TSYLinkedList *list = TSYAutoreleasePoolGetList(pool);
    
    if (NULL == currentStack || TSYAutoreleasingStackIsFull(currentStack)) {
        TSYAutoreleasingStack *stack = TSYAutoreleasingStackCreateWithSize(TSYAutoreleaseStackSize);
        TSYAutoreleasePoolSetCurrentStack(pool, stack);
        TSYObjectRelease(stack);
        
        TSYLinkedListAddObject(list, stack);
        pool->_stackCount++;
    }
    
    TSYAutoreleasingStackPushObject(currentStack, object);
}

void TSYAutoreleasePoolAddObject(TSYAutoreleasePool *pool, void *object) {
    if (NULL == pool || NULL == object) {
        return;
    }
    
    TSYAutoreleasePoolInsertObject(pool, object);
}

void TSYAutoreleasePoolDrain(TSYAutoreleasePool *pool) {
    if (NULL == pool) {
        return;
    }
    
    TSYLinkedList *list = TSYAutoreleasePoolGetList(pool);
    TSYAutoreleasingStack *currentStack = TSYAutoreleasePoolGetCurrentStack(pool);
    
    TSYLinkedListEnumerator *enumerator = TSYLinkedListEnumeratorCreateWithLinkedList(list);
    
    while (TSYAutoreleasingStackObjectPop == TSYAutoreleasingStackPopObjects(currentStack) &&
           TSYLinkedListEnumeratorIsValid(enumerator))
    {
        if (TSYAutoreleasingStackIsEmpty(currentStack)) {
            pool->_emptyStackCount++;
            TSYAutoreleasePoolDeflateIfNeeded(pool);
            
            currentStack = TSYLinkedListEnumeratorGetNextObject(enumerator);
            TSYAutoreleasePoolSetCurrentStack(pool, currentStack);
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

TSYAutoreleasingStack *TSYAutoreleasePoolGetCurrentStack(TSYAutoreleasePool *pool) {
    return (NULL != pool) ? pool->_currentStack : NULL;
}

void TSYAutoreleasePoolSetCurrentStack(TSYAutoreleasePool *pool, TSYAutoreleasingStack *stack) {
    if (NULL == pool) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&pool->_currentStack, stack);
}

TSYAutoreleasePool *TSYAutoreleasePoolGetPool() {
    return __TSYAutoreleasePool;
}

TSYLinkedList *TSYAutoreleasePoolGetList(TSYAutoreleasePool *pool) {
    return (NULL != pool) ? pool->_list : NULL;
}

void TSYAutoreleasePoolSetList(TSYAutoreleasePool *pool, TSYLinkedList *list) {
    if (NULL == pool) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&pool->_list, list);
}

uint64_t TSYAutoreleasePoolGetEmptyStackCount(TSYAutoreleasePool *pool) {
    return (NULL != pool) ? pool->_emptyStackCount : 0;
}

void TSYAutoreleasePoolDeflateIfNeeded(TSYAutoreleasePool *pool) {
    if (NULL == pool) {
        return;
    }
    
    uint64_t maxEmptyStackCount = TSYAutoreleasePoolMaxEmptyStackCount;
    
    if (maxEmptyStackCount <= TSYAutoreleasePoolGetEmptyStackCount(pool)) {
        TSYAutoreleasePoolDeflate(pool);
    }
}

void TSYAutoreleasePoolDeflate(TSYAutoreleasePool *pool) {
    if (NULL == pool) {
        return;
    }
    
    TSYLinkedList *list = TSYAutoreleasePoolGetList(pool);
    TSYLinkedListRemoveFirstObject(list);
    pool->_emptyStackCount--;
}
