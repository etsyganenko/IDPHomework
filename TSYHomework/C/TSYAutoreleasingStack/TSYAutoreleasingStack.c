//
//  TSYAutoreleasingStack.c
//  TSYHomework
//
//  Created by Admin on 26.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYAutoreleasingStack.h"

#pragma mark -
#pragma mark Private Declarations

void TSYAutoreleasingStackSetSize(TSYAutoreleasingStack *stack, uint64_t size);

void TSYAutoreleasingStackSetObjects(TSYAutoreleasingStack *stack, void **objects);

void **TSYAutoreleasingStackGetHead(TSYAutoreleasingStack *stack);

#pragma mark -
#pragma mark Public Implementations

TSYAutoreleasingStack *TSYAutoreleasingStackCreateWithSize(uint64_t size) {
    TSYAutoreleasingStack *stack = TSYObjectCreate(TSYAutoreleasingStack);
    
    TSYAutoreleasingStackSetSize(stack, size);
    
    return stack;
}

void __TSYAutoreleasingStackDeallocate(TSYAutoreleasingStack *stack) {
    if (NULL != stack) {
        TSYAutoreleasingStackPopAllObjects(stack);
        TSYAutoreleasingStackSetSize(stack, 0);
        
        __TSYObjectDeallocate(stack);
    }
}

uint64_t TSYAutoreleasingStackGetSize(TSYAutoreleasingStack *stack) {
    return (NULL != stack) ? stack->_size : 0;
}

uint64_t TSYAutoreleasingStackGetCurrentSize(TSYAutoreleasingStack *stack) {
    return (NULL != stack) ? stack->_currentSize : 0;
}

void **TSYAutoreleasingStackGetObjects(TSYAutoreleasingStack *stack) {
    return (NULL != stack) ? stack->_objects : NULL;
}

void TSYAutoreleasingStackPushObject(TSYAutoreleasingStack *stack, void *object) {
    if (NULL == stack) {
        return;
    }
    
    if (!TSYAutoreleasingStackIsFull(stack)) {
        void **head = TSYAutoreleasingStackGetHead(stack);
        
        *head = object;
        
        stack->_currentSize += sizeof(object);
    }
}

TSYAutoreleasingStackPopResult TSYAutoreleasingStackPopObject(TSYAutoreleasingStack *stack) {
    TSYAutoreleasingStackPopResult result = TSYAutoreleasingStackNullPop;
    
    if (NULL != stack && !TSYAutoreleasingStackIsEmpty(stack)) {
        stack->_currentSize -= sizeof(*TSYAutoreleasingStackGetObjects(stack));
        
        void **head = TSYAutoreleasingStackGetHead(stack);
        
        if (NULL != *head) {
            result = TSYAutoreleasingStackObjectPop;
        }
        
        TSYObjectRelease(*head);
    }
    
    return result;
}

TSYAutoreleasingStackPopResult TSYAutoreleasingStackPopObjects(TSYAutoreleasingStack *stack) {
    if (NULL != stack) {
        while (TSYAutoreleasingStackObjectPop == TSYAutoreleasingStackPopObject(stack)) {
            if (TSYAutoreleasingStackIsEmpty(stack)) {
                return TSYAutoreleasingStackObjectPop;
            }
        }
    }
    
    return TSYAutoreleasingStackNullPop;
}

void TSYAutoreleasingStackPopAllObjects(TSYAutoreleasingStack *stack) {
    if (NULL != stack) {
        while (!TSYAutoreleasingStackIsEmpty(stack)) {
            TSYAutoreleasingStackPopObject(stack);
        }
    }
}

bool TSYAutoreleasingStackIsFull(TSYAutoreleasingStack *stack) {
    return (NULL != stack) && (TSYAutoreleasingStackGetSize(stack) == TSYAutoreleasingStackGetCurrentSize(stack));
}

bool TSYAutoreleasingStackIsEmpty(TSYAutoreleasingStack *stack) {
    return (NULL != stack) && (0 == TSYAutoreleasingStackGetCurrentSize(stack));
}

#pragma mark -
#pragma mark Private Implementations

void TSYAutoreleasingStackSetSize(TSYAutoreleasingStack *stack, uint64_t size) {
    if (NULL == stack || size == stack->_size ) {
        return;
    }
    
    if (NULL != stack->_objects) {
        free(stack->_objects);
        stack->_objects = NULL;
    }
    
    stack->_size = size;
    
    if (0 != stack->_size) {
        stack->_objects = calloc(size, sizeof(*stack->_objects));
    }
}

void **TSYAutoreleasingStackGetHead(TSYAutoreleasingStack *stack) {
    return (NULL != stack) ? (stack->_objects + TSYAutoreleasingStackGetCurrentSize(stack) / sizeof(*stack->_objects)) : NULL;
}
