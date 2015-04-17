//
//  TSYObject.c
//  TSYHomework
//
//  Created by Admin on 27.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYObject.h"

#pragma mark -
#pragma mark Public Implementations

void *__TSYObjectCreate(size_t objectSize, TSYDeallocateCallback deallocateCallback) {
    TSYObject *object = calloc(1, objectSize);
    object->_deallocateCallback = deallocateCallback;
    object->_referenceCount = 1;
    
    return object;
}

uint64_t TSYObjectGetReferenceCount(void *object) {
    if (NULL == object) {
        return 0;
    }
    
    TSYObject *objectRef = (TSYObject *)object;
    
    return objectRef->_referenceCount;
}

void TSYObjectRetain(void *object) {
    if (NULL != object) {
        TSYObject *objectRef = (TSYObject *)object;
        objectRef->_referenceCount++;
    }
}

void TSYObjectRelease(void *object) {
    if (NULL == object) {
        return;
    }
    
    TSYObject *objectRef = (TSYObject *)object;
    
    objectRef->_referenceCount--;
    
    if (0 == TSYObjectGetReferenceCount(objectRef)) {
        objectRef->_deallocateCallback(object);
    }
}

void __TSYObjectDeallocate(void *object) {
    free(object);
}
