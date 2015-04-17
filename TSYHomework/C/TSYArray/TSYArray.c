//
//  TSYArray.c
//  TSYHomework
//
//  Created by Admin on 02.03.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#include "TSYArray.h"

const uint64_t TSYObjectNotFound = UINT64_MAX;

#pragma mark -
#pragma mark Private Declarations

void TSYArraySetLength(TSYArray *array, uint64_t length);

void TSYArrayResizeIfNeeded(TSYArray *array);

uint8_t TSYArrayProposedLength(TSYArray *array);

#pragma mark -
#pragma mark Public Implementations

TSYArray *TSYArrayCreate() {
//    TSYArray *array = TSYObjectCreate(sizeof(*array), &TSYArrayDeallocate);
    
    TSYArray *array = TSYObjectCreate(TSYArray);
    
    return array;
}

uint64_t TSYArrayGetCount(TSYArray *array) {
    return (NULL != array) ? array->_count : 0;
}

void TSYArrayAddObject(TSYArray *array, void *object) {
    if (NULL == array || NULL == object) {
        return;
    }
    
    TSYArrayResizeIfNeeded(array);
    
    TSYArraySetObjectAtIndex(array, object, TSYArrayGetCount(array));
    array->_count += 1;
}

void TSYArrayRemoveObject(TSYArray *array, void *object) {
    if (NULL == array || NULL == object) {
        return;
    }
    
    TSYArrayRemoveObjectAtIndex(array, TSYArrayGetIndexOfObject(array, object));
}

void TSYArrayRemoveAllObjects(TSYArray *array) {
    if (NULL == array) {
        return;
    }
    
    for (int64_t iter = TSYArrayGetCount(array) - 1; iter >= 0; iter--) {
        TSYArrayRemoveObjectAtIndex(array, iter);
    }
}

bool TSYArrayContainsObject(TSYArray *array, void *object) {
    return (TSYObjectNotFound != TSYArrayGetIndexOfObject(array, object));
}

void *TSYArrayGetObjectAtIndex(TSYArray *array, uint64_t index) {
    if (NULL != array) {
        assert(index < TSYArrayGetCount(array));
    }
    
    return array->_objects[index];
}

void TSYArraySetObjectAtIndex(TSYArray *array, void *object, uint64_t index) {
    if (NULL == array || NULL == object || index > TSYArrayGetCount(array)) {
        return;
    }
    
    TSYPropertyRetainSet((void **)&(array->_objects[index]), object);
}

uint64_t TSYArrayGetIndexOfObject(TSYArray *array, void *object) {
    for (uint64_t iter = 0; iter < TSYArrayGetCount(array); iter++) {
        if (array->_objects[iter] == object) {
            return iter;
        }
    }
    
    return TSYObjectNotFound;
}

void TSYArrayRemoveObjectAtIndex(TSYArray *array, uint64_t index) {
    if (NULL == array || index >= TSYArrayGetCount(array)) {
        return;
    }
    
    uint64_t count = TSYArrayGetCount(array) - 1;
    
    TSYArraySetObjectAtIndex(array, NULL, index);
    
    if (index != count) {
        TSYArraySetObjectAtIndex(array, array->_objects[count], index);
        TSYArraySetObjectAtIndex(array, NULL, count);
    }
    
    array->_count = count;
    
    TSYArrayResizeIfNeeded(array);
}

void __TSYArrayDeallocate(TSYArray *array) {
    if (NULL != array) {
        TSYArrayRemoveAllObjects(array);
        TSYArraySetLength(array, 0);
    }
    
    __TSYObjectDeallocate(array);
}

#pragma mark -
#pragma mark Private Implementations

uint64_t TSYArrayGetLength(TSYArray *array) {
    return (NULL != array) ? array->_length : 0;
}

void TSYArrayResizeIfNeeded(TSYArray *array) {
    if (NULL != array) {
        TSYArraySetLength(array, TSYArrayProposedLength(array));
    }
}

uint8_t TSYArrayProposedLength(TSYArray *array) {
    uint64_t count = TSYArrayGetCount(array);
    uint64_t length = TSYArrayGetLength(array);
    
    if (0 == count && 0 == length) {
        return 2;
    }
    
    if (count == length) {
        if (count < 1024) {
            return (length * 2);
        } else {
            return (length + 500);
        }
    }
    
    if (count < (length * 0.3)) {
        return (length / 2);
    }
    
    return length;
}

void TSYArraySetLength(TSYArray *array, uint64_t newLength) {
    if (NULL == array || newLength == TSYArrayGetLength(array)) {
        return;
    }
    
    uint64_t count = TSYArrayGetCount(array);
    uint64_t length = TSYArrayGetLength(array);
    
    if (newLength < length) {
        for (uint64_t iter = count - newLength + 1; iter < count; iter++) {
            TSYObjectRelease(array->_objects[iter]);
        }
    }
    
    if (0 == newLength) {
        free(array->_objects);
        array->_objects = NULL;
    } else {
        array->_objects = realloc(array->_objects, newLength * sizeof(*(array->_objects)));
        assert(NULL != array->_objects);
    }
    
    if (newLength > length) {
        memset(&array->_objects[count],
               0,
               (newLength - length) * sizeof(*(array->_objects)));
    }
    
    array->_length = newLength;
}
